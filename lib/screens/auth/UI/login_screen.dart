import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
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
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Welcome To Our Market",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Center(
                heightFactor: 1.5,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        color: Colors.redAccent.shade100,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(-10, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: deviceHeight! * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFormField(
                        labelText: "Email",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email_outlined,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight! * 0.02),
                      CustomTextFormField(
                        isPassword: true,
                        labelText: "Password",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.lock_outline,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
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
                      SizedBox(height: deviceHeight! * 0.01),
                      CustomButton(
                        deviceWidth: deviceWidth,
                        deviceHeight: deviceHeight,
                        textButton: "Login",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.mainNavBar);
                        },
                      ),
                      SizedBox(height: deviceHeight! * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: deviceWidth! * 0.2,
                            child: Divider(color: AppColors.kGreyColor),
                          ),
                          Text("Or Sign Up With"),
                          SizedBox(
                            width: deviceWidth! * 0.2,
                            child: Divider(color: AppColors.kGreyColor),
                          ),
                        ],
                      ),
                      SizedBox(height: deviceHeight! * 0.01),
                      CustomLoginMethods(deviceWidth: deviceWidth),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
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
            ],
          ),
        ),
      ),
    );
  }
}
