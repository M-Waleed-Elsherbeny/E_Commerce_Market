import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.textButton,
    this.onPressed, this.leftIcon, this.rightIcon,
  });
  final double? buttonWidth, buttonHeight;
  final String textButton;
  final VoidCallback? onPressed;
  final IconData? leftIcon, rightIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth ?? 50, buttonHeight ?? 50),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(leftIcon, color: AppColors.kWhiteColor, size: 16.sp),
          Text(
            textButton,
            style: TextStyle(color: AppColors.kWhiteColor, fontSize: 16.sp),
          ),
          Icon(rightIcon, color: AppColors.kWhiteColor, size: 16.sp),
        ],
      ),
    );
  }
}
