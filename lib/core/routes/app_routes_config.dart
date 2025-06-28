import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/screens/auth/ui/forget_password_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/login_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/signup_screen.dart';
import 'package:my_e_commerce_app/screens/navigation/logic/cubit/nav_bar_cubit.dart';
import 'package:my_e_commerce_app/screens/navigation/ui/main_nav_bar.dart';
import 'package:my_e_commerce_app/screens/products_details/ui/product_details_screen.dart';
import 'package:my_e_commerce_app/screens/profile/widgets/edit_profile_view.dart';
import 'package:my_e_commerce_app/screens/profile/widgets/my_orders_view.dart';

class AppRoutesConfig {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.mainNavBar:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => NavBarCubit(),
                child: const MainNavBar(),
              ),
        );
      case AppRoutes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileView());
      case AppRoutes.myOrdersView:
        return MaterialPageRoute(builder: (_) => const MyOrdersView());
      case AppRoutes.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ProductDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
