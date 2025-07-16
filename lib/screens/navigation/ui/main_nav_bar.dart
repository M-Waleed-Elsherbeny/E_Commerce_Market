import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/screens/cart/ui/cart_screen.dart';
import 'package:my_e_commerce_app/screens/favorite/ui/favorite_screen.dart';
import 'package:my_e_commerce_app/screens/home/ui/home_screen.dart';
import 'package:my_e_commerce_app/screens/navigation/logic/cubit/nav_bar_cubit.dart';
import 'package:my_e_commerce_app/screens/profile/ui/profile_screen.dart';
import 'package:my_e_commerce_app/screens/store/ui/store_screen.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({super.key});
  final List<Widget> _screens = const [
    HomeScreen(),
    StoreScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              bottomNavigationBar: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.kWhiteColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: GNav(
                    hoverColor:
                        AppColors.kPrimaryColor, // tab button hover color
                    curve: Curves.easeInOut, // tab animation curves
                    duration: Duration(
                      milliseconds: 200,
                    ), // tab animation duration
                    gap: 10, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor:
                        AppColors.kYellowColor, // selected icon and text color
                    iconSize: 30, // tab button icon size
                    tabBackgroundColor:
                        AppColors
                            .kPrimaryColor, // selected tab background color
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ), // navigation bar padding
                    tabs: [
                      GButton(icon: Icons.home_outlined, text: 'Home'),
                      GButton(
                        icon: Icons.store_mall_directory_outlined,
                        text: 'Store',
                      ),
                      GButton(
                        icon: Icons.favorite_border_rounded,
                        text: 'Favorites',
                      ),
                      GButton(
                        icon: Icons.shopping_basket_outlined,
                        text: 'Cart',
                      ),
                      GButton(
                        icon: Icons.person_outline_rounded,
                        text: 'Profile',
                      ),
                    ],
                    onTabChange: (index) {
                      cubit.changeIndex(index);
                    },
                  ),
                ),
              ),
              body: IndexedStack(
                index:
                    cubit
                        .currentIndex, // This index will be updated based on the selected tab
                children: _screens,
              ),
            ),
          );
        },
      ),
    );
  }
}
