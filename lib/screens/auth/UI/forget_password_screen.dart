import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_state.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  double? deviceWidth, deviceHeight;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            customSnackBar(context, "Reset link sent to your email");
            context.pop();
          } else if (state is ResetPasswordError) {
            customSnackBar(
              context,
              state.errorMessage,
              backgroundColor: AppColors.kRedColor,
            );
          }
        },
        builder: (context, state) {
          return state is ResetPasswordLoading
              ? CustomLoading()
              : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Reset Your Password",
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
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomTextFormField(
                                  controller: emailController,
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
                                CustomButton(
                                  buttonWidth: deviceWidth,
                                  buttonHeight: deviceHeight! * 0.05,
                                  textButton: "Send Reset Link",
                                  onPressed: () {
                                    context
                                        .read<AuthenticationCubit>()
                                        .resetPassword(emailController.text);
                                  },
                                ),
                                HeightSpacer(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
