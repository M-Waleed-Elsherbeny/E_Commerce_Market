import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.kWhiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: GNav(
            hoverColor: AppColors.kPrimaryColor, // tab button hover color
            curve: Curves.easeInOut, // tab animation curves
            duration: Duration(milliseconds: 200), // tab animation duration
            gap: 10, // the tab button gap between icon and text
            color: AppColors.kGreyColor, // unselected icon color
            activeColor: AppColors.kWhiteColor, // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor:
                AppColors.kPrimaryColor, // selected tab background color
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ), // navigation bar padding
            tabs: [
              GButton(icon: Icons.home_outlined, text: 'Home'),
              GButton(icon: Icons.store_mall_directory_outlined, text: 'Store'),
              GButton(icon: Icons.favorite_border_rounded, text: 'Likes'),
              GButton(icon: Icons.shopping_basket_outlined, text: 'Likes'),
              GButton(icon: Icons.person_outline_rounded, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
