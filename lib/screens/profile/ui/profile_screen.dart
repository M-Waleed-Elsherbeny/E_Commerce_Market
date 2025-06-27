import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          heightFactor: 1.5,
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            color: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                    "Mohammed Waleed",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HeightSpacer(height: 5),
                  Text(
                    "m.elsherbeny100@gmail.com",
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  HeightSpacer(height: 20),
                  CustomProfileButton(
                    textButton: "Edit Profile",
                    leftIcon: Icons.edit_rounded,
                    rightIcon: Icons.arrow_forward_ios_rounded,
                    onPressed: () {},
                  ),
                  HeightSpacer(height: 20),
                  CustomProfileButton(
                    textButton: "My Orders",
                    leftIcon: Icons.shopping_bag_rounded,
                    rightIcon: Icons.arrow_forward_ios_rounded,
                    onPressed: () {},
                  ),
                  HeightSpacer(height: 20),
                  CustomProfileButton(
                    textButton: "Logout",
                    leftIcon: Icons.logout_rounded,
                    rightIcon: Icons.arrow_forward_ios_rounded,
                    onPressed: () {},
                  ),
                  HeightSpacer(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
