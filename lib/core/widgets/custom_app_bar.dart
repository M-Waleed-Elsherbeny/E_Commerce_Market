import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

AppBar buildCustomAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    centerTitle: true,
    
    title: Text(title),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      color: AppColors.kWhiteColor,
      fontWeight: FontWeight.bold,
    ),
    leading: IconButton(
      onPressed: () {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: AppColors.kWhiteColor,
    ),
    toolbarHeight: 50.h,
  );
}
