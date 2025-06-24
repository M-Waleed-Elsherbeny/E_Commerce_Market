import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/screens/auth/ui/forget_password_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/login_screen.dart';
import 'package:my_e_commerce_app/screens/auth/ui/signup_screen.dart';

class AppRoutesConfig {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
