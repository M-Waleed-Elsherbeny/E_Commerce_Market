import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/core/widgets/custom_card_info.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_state.dart';
import 'package:my_e_commerce_app/screens/auth/logic/models/user_data_model.dart';
import 'package:my_e_commerce_app/screens/profile/widgets/custom_profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          customSnackBar(context, "Logout successful");
        }
        if (state is LogoutError) {
          customSnackBar(
            context,
            state.errorMessage,
            backgroundColor: AppColors.kRedColor,
          );
        }
      },
      builder: (context, state) {
        UserDataModel? userData =
            context.read<AuthenticationCubit>().userDataModel;
        if (userData == null) {
          context.read<AuthenticationCubit>().getUserData();
        }
        return state is LogoutLoading || state is GetUserDataLoading
            ? Center(
              child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
            )
            : SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  heightFactor: 1.5,
                  child: CustomCardInfo(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.kPrimaryColor,
                            foregroundColor: AppColors.kWhiteColor,
                            radius: 40.r,
                            child: Icon(Icons.person, size: 50.sp),
                          ),
                          HeightSpacer(height: 10),
                          Text(
                            userData?.name ?? "User Name",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          HeightSpacer(height: 5),
                          Text(
                            userData?.email ?? "email",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                          HeightSpacer(height: 20),
                          CustomProfileButton(
                            textButton: "Change Name",
                            leftIcon: Icons.edit_rounded,
                            rightIcon: Icons.arrow_forward_ios_rounded,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.editProfileScreen,
                              );
                            },
                          ),
                          HeightSpacer(height: 20),
                          CustomProfileButton(
                            textButton: "My Orders",
                            leftIcon: Icons.shopping_bag_rounded,
                            rightIcon: Icons.arrow_forward_ios_rounded,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.myOrdersView,
                              );
                            },
                          ),
                          HeightSpacer(height: 20),
                          CustomProfileButton(
                            textButton: "Logout",
                            leftIcon: Icons.logout_rounded,
                            rightIcon: Icons.arrow_forward_ios_rounded,
                            onPressed: () async {
                              await context
                                  .read<AuthenticationCubit>()
                                  .userLogout();
                            },
                          ),
                          HeightSpacer(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
}
