import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Welcome to Store",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          CustomSearchField(
            labelText: 'Search In Store...',
            suffixIcon: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              tooltip: "Search",
              icon: Icon(Icons.search, color: AppColors.kWhiteColor, size: 40),
              onPressed: () {},
            ),
          ),
          HeightSpacer(height: 10),
          ProductCardItems(),
          HeightSpacer(height: 15),
        ],
      ),
    );
  }
}
