import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/assets/app_assets.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomLoginMethods extends StatelessWidget {
  const CustomLoginMethods({super.key, required this.deviceWidth});

  final double? deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          splashColor: AppColors.kPrimaryColor.withAlpha(100),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          icon: Image.asset(
            AppAssets.googleIcon,
            width: deviceWidth! * 0.09,
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          splashColor: AppColors.kPrimaryColor.withAlpha(100),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          icon: Icon(
            Icons.facebook_outlined,
            size: 40,
            color: AppColors.kPrimaryColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.apple_outlined, size: 40),
        ),
      ],
    );
  }
}
