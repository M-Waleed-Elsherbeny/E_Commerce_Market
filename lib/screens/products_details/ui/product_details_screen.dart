import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:my_e_commerce_app/core/widgets/custom_card_info.dart';
import 'package:my_e_commerce_app/core/widgets/custom_catch_image.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_text_field.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Product Name"),
      body: ListView(
        children: [
          CustomCachedImage(
            url:
                "https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?uid=R162128033&ga=GA1.1.971563098.1745924156&semt=ais_items_boosted&w=740", // Replace with your product image
          ),
          HeightSpacer(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$99.99", // Replace with your product price
                      style: TextStyle(fontSize: 24.sp),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: [
                      Text(
                        "3  ", // Replace with your product price
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
                CustomCardInfo(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    height: 150.h,
                    child: Center(
                      child: Text(
                        "Product Description",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                HeightSpacer(height: 10),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder:
                      (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    log(rating.toString());
                  },
                ),
                HeightSpacer(height: 10),
                CustomTextFormField(
                  labelText: "Write a review",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_outlined,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                HeightSpacer(height: 15),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Comments",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                HeightSpacer(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
