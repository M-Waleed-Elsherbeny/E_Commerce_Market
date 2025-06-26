import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/assets/app_assets.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/home/models/card_items_model.dart';
import 'package:my_e_commerce_app/screens/home/models/categories_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imageStore2),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
          ),
        ),
        HeightSpacer(height: 15),
        Text(
          "Popular Categories",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        HeightSpacer(height: 10),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            itemCount: CategoriesModel.getCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      CategoriesModel.getCategories[index].title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kBlackColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        HeightSpacer(height: 15),
        Text(
          "Recently Products",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        HeightSpacer(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: CardItemsModel.cardItems.length,
          itemBuilder: (context, index) {
            return ProductsCardItems(
              index: index,
              cardItemsList: CardItemsModel.cardItems,
            );
          },
        ),
        HeightSpacer(height: 15),
      ],
    );
  }
}
