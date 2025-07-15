import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/functions/custom_navigations.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/home/models/categories_model.dart';
import 'package:my_e_commerce_app/screens/home/ui/category_filter_view.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        itemCount: CategoriesModel.getCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GestureDetector(
              onTap: () {
                String categoryName = CategoriesModel.getCategories[index].categoryName;
                log(categoryName);
                customPushNavigate(context, CategoryFilterView(categoryName: categoryName));
              },
              child: Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor,
                      maxRadius: 30.r,
                      child: Icon(
                        CategoriesModel.getCategories[index].icon,
                        color: AppColors.kWhiteColor,
                        size: 40.sp,
                      ),
                    ),
                  ),
                  HeightSpacer(height: 5),
                  Text(
                    CategoriesModel.getCategories[index].categoryName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlackColor,
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
