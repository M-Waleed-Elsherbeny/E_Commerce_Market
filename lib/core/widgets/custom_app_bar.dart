import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

AppBar buildCustomAppBar(
  BuildContext context,
  String title, {
  bool canPop = true,
}) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    centerTitle: true,

    title: Text(title),
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      color: AppColors.kWhiteColor,
      fontWeight: FontWeight.bold,
    ),
    leading:
        canPop
            ? IconButton(
              onPressed: () {
                context.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: AppColors.kWhiteColor,
            )
            : Container(),
    toolbarHeight: 50.h,
  );
}
