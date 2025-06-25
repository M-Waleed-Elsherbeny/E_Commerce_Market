import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_login_methods.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                "Create Your Account",
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
                        color: AppColors.kYellowColor,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(-10, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: deviceHeight! * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFormField(
                        labelText: "Name",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person_outline_outlined,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      HeightSpacer(height: 10),
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
                      HeightSpacer(height: 10),
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
                      HeightSpacer(height: 30),
                      CustomButton(
                        deviceWidth: deviceWidth,
                        deviceHeight: deviceHeight,
                        textButton: "Sign Up",
                        onPressed: () {},
                      ),
                      HeightSpacer(height: 20),
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
                      HeightSpacer(height: deviceHeight! * 0.01),
                      CustomLoginMethods(deviceWidth: deviceWidth),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
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
