import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: AppColors.kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: child,
    );
  }
}
