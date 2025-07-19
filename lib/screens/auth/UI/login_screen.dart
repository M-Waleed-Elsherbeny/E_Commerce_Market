import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_state.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_text_field.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_login_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double? deviceWidth, deviceHeight;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          context.pushReplacementNamed(
            AppRoutes.mainNavBar,
          );
          customSnackBar(
            context,
            state is LoginSuccess
                ? "Login Successful"
                : "Google Sign In Successful",
            backgroundColor: AppColors.kPrimaryColor,
          );
        }
        if (state is LoginError) {
          customSnackBar(
            context,
            state.errorMessage,
            backgroundColor: AppColors.kPrimaryColor,
          );
        }
        if (state is GoogleSignInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.kPrimaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          body:
              state is LoginLoading || state is GoogleSignInLoading
                  ? CustomLoading()
                  : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Welcome To Our Market",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Center(
                            heightFactor: 1.5,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.kWhiteColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.kPrimaryColor,
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                    offset: Offset(8, 0),
                                  ),
                                  BoxShadow(
                                    color: AppColors.kYellowColor,
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(-10, 10),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                              ),
                              height: 375.h,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CustomTextFormField(
                                      labelText: "Email",
                                      controller: emailController,
                                      prefixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.email_outlined,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    HeightSpacer(height: 10),
                                    CustomTextFormField(
                                      labelText: "Password",
                                      controller: passwordController,
                                      isPassword: isPasswordVisible,
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isPasswordVisible =
                                                !isPasswordVisible;
                                          });
                                        },
                                        icon: Icon(
                                          isPasswordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          context.push(
                                            AppRoutes.forgetPasswordScreen,
                                          );
                                        },
                                        child: Text(
                                          "Forget Password?",
                                          style: TextStyle(
                                            color: AppColors.kPrimaryColor,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    HeightSpacer(height: 10),
                                    CustomButton(
                                      buttonWidth: deviceWidth,
                                      buttonHeight: deviceHeight! * 0.05,
                                      textButton: "Login",
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    HeightSpacer(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: deviceWidth! * 0.2,
                                          child: Divider(
                                            color: AppColors.kGreyColor,
                                          ),
                                        ),
                                        Text("Or Sign Up With"),
                                        SizedBox(
                                          width: deviceWidth! * 0.2,
                                          child: Divider(
                                            color: AppColors.kGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    HeightSpacer(height: 10),
                                    CustomLoginMethods(
                                      deviceWidth: deviceWidth,
                                      onGoogleSignIn: () async {
                                        await cubit.signInGoogle();
                                      },
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account?"),
                                        TextButton(
                                          onPressed: () {
                                            context.pushNamed(
                                              AppRoutes.registerScreen,
                                            );
                                          },
                                          child: Text(
                                            "Register Now",
                                            style: TextStyle(
                                              color: AppColors.kPrimaryColor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
        );
      },
    );
  }
}
