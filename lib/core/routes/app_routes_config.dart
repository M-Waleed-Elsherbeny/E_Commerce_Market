import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/cubit/get_products_cubit.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/screens/auth/ui/forget_password_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/login_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/signup_screen.dart';
import 'package:my_e_commerce_app/screens/home/ui/home_screen.dart';
import 'package:my_e_commerce_app/screens/navigation/logic/cubit/nav_bar_cubit.dart';
import 'package:my_e_commerce_app/screens/navigation/ui/main_nav_bar.dart';
import 'package:my_e_commerce_app/screens/products_details/ui/product_details_screen.dart';
import 'package:my_e_commerce_app/screens/profile/widgets/edit_profile_view.dart';
import 'package:my_e_commerce_app/screens/profile/widgets/my_orders_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRoutesConfig {
  static final SupabaseClient client = Supabase.instance.client;
  static final GoRouter router = GoRouter(
    initialLocation:
        client.auth.currentUser != null
            ? AppRoutes.mainNavBar
            : AppRoutes.loginScreen,
    errorBuilder:
        (context, state) => const Scaffold(body: Center(child: Text('Error'))),
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.forgetPasswordScreen,
        path: AppRoutes.forgetPasswordScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const ForgetPasswordScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SignupScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.mainNavBar,
        path: AppRoutes.mainNavBar,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NavBarCubit(),
              ),
              BlocProvider(
                create: (context) => GetProductsCubit(),
              ),
              
            ],
            child: MainNavBar(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.homeScreen,
        path: AppRoutes.homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: AppRoutes.editProfileScreen,
        path: AppRoutes.editProfileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const EditProfileView();
        },
      ),
      GoRoute(
        name: AppRoutes.myOrdersView,
        path: AppRoutes.myOrdersView,
        builder: (BuildContext context, GoRouterState state) {
          return const MyOrdersView();
        },
      ),
      GoRoute(
        name: AppRoutes.productDetailsScreen,
        path: AppRoutes.productDetailsScreen,
        builder: (BuildContext context, GoRouterState state) {
          final HomeProductsModel productsModel =
              state.extra as HomeProductsModel;
          return ProductDetailsScreen(productsModel: productsModel);
        },
      ),
    ],
  );
}
