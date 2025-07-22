import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/assets/app_assets.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_search_field.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_state.dart';
import 'package:my_e_commerce_app/screens/auth/logic/models/user_data_model.dart';
import 'package:my_e_commerce_app/screens/home/logic/payment_initialize.dart';
import 'package:my_e_commerce_app/screens/home/ui/search_view.dart';
import 'package:my_e_commerce_app/screens/home/widgets/categories_items.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  UserDataModel? userData;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        padding: EdgeInsets.only(top: 10.w),
        children: [
          CustomSearchField(
            controller: searchController,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SearchView(query: searchController.text),
                  ),
                );
              },
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
          CategoriesItems(),
          HeightSpacer(height: 15),
          Text(
            "Recently Products",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          HeightSpacer(height: 15),
          BlocProvider(
            create: (context) => AuthenticationCubit()..getUserData(),
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                if (state is GetUserDataSuccess) {
                  userData = context.read<AuthenticationCubit>().userDataModel;
                  log("Home Screen User Data: ${userData?.email}");
                    PaymentInitialize.paymentInit(
                    userData: UserData(
                      email: userData!.email,
                      name: userData!.name,
                    ),
                  );
                }
                return ProductCardItems();
              },
            ),
          ),
          HeightSpacer(height: 15),
        ],
      ),
    );
  }
}
