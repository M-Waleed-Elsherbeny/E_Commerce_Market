import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/database/supabase_config.dart';
import 'package:my_e_commerce_app/core/observer/my_bloc_observer.dart';
import 'package:my_e_commerce_app/core/routes/app_routes_config.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_ANON_KEY);
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

SupabaseClient client = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // log('Current User: ${client.auth.currentUser?.email ?? 'No user logged in'}');
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocProvider(
          create: (context) => AuthenticationCubit()..getUserData(),
          child: MaterialApp.router(
            title: 'E-Commerce Market',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
            routerConfig: AppRoutesConfig.router,
          ),
        );
      },
    );
  }
}
