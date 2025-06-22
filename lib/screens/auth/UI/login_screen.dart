import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

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
        child: Center(
          child: Column(
            children: [
              Text(
                "Welcome To Our Market",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: AppColors.kGreyColor, blurRadius: 5),
                  ],
                ),
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                height: deviceHeight! * 0.8,
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
                    SizedBox(height: 20),
                    CustomTextFormField(
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
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceHeight! * 0.05),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(deviceWidth!, deviceHeight! * 0.05),
                        backgroundColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: deviceHeight! * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: deviceWidth! * 0.25,
                          child: Divider(
                            color: AppColors.kGreyColor,
                            thickness: 2,
                          ),
                        ),
                        Text(
                          "Or Login With",
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth! * 0.25,
                          child: Divider(
                            color: AppColors.kGreyColor,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: deviceHeight! * 0.05),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.kPrimaryColor,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        prefixIcon: prefixIcon,
        label: Text(
          labelText,
          style: TextStyle(fontSize: 15, color: AppColors.kGreyColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}


// Preparing login Screen UI