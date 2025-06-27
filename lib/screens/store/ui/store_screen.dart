import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/home/models/card_items_model.dart';
import 'package:my_e_commerce_app/screens/home/models/categories_model.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
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
