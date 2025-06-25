import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/custom_search_field.dart';

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
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ),
      ],
    );
  }
}
