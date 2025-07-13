import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';

class CategoryFilterView extends StatelessWidget {
  const CategoryFilterView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, categoryName),
      body: ListView(
        children: [
          HeightSpacer(height: 10),
          ProductCardItems(category: categoryName),
        ],
      ),
    );
  }
}
