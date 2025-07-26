import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/cubit/get_products_cubit.dart';
import 'package:my_e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/core/widgets/custom_catch_image.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/core/widgets/width_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class ProductCardItems extends StatelessWidget {
  const ProductCardItems({
    super.key,
    this.isShrinkWrap,
    this.physics,
    this.onTap,
    this.query,
    this.category,
    this.isFavoriteScreen = false,
    this.isSoldScreen = false,
  });
  final bool? isShrinkWrap;
  final ScrollPhysics? physics;
  final VoidCallback? onTap;
  final String? query, category;
  final bool isFavoriteScreen, isSoldScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductsCubit>(
      create:
          (context) =>
              GetProductsCubit()..getProducts(query: query, category: category),
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
        listener: (context, state) {
          if (state is BuyProductSuccess) {
            customSnackBar(
              context,
              "Product purchased successfully!",
              backgroundColor: AppColors.kPrimaryColor,
            );
            context.go(AppRoutes.mainNavBar);
          }
        },
        builder: (context, state) {
          GetProductsCubit getProductsCubit = context.read<GetProductsCubit>();
          List<HomeProductsModel> products =
              query != null
                  ? getProductsCubit.searchResult
                  : category != null
                  ? getProductsCubit.categoriesResult
                  : isFavoriteScreen
                  ? getProductsCubit.favoriteProductsList
                  : isSoldScreen
                  ? getProductsCubit.soldProductsList
                  : getProductsCubit.products;
          return state is GetProductsLoading
              ? CustomLoading()
              : ListView.builder(
                shrinkWrap: isShrinkWrap ?? true,
                physics: physics ?? const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  bool isFavorite = getProductsCubit.checkIsFavorite(
                    products[index].productId!,
                  );
                  return CardItems(
                    products: products[index],
                    isFavorite: isFavorite,
                    textButton: getProductsCubit.isProductSold(
                      products[index].productId!,
                    )? "Buy Again" : "Buy Now",
                    onTap: () {
                      isFavorite
                          ? getProductsCubit.deleteFavoriteProduct(
                            products[index].productId!,
                          )
                          : getProductsCubit.addFavoriteProduct(
                            products[index].productId!,
                          );
                    },
                    onPaymentSuccess: () async {
                      await getProductsCubit.buyProduct(
                        products[index].productId!,
                      );
                      if (context.mounted) {
                        context.pushReplacementNamed(AppRoutes.mainNavBar);
                      }
                    },
                  );
                },
              );
        },
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.products,
    this.onTap,
    required this.onPaymentSuccess,
    required this.isFavorite,required this.textButton,
  });

  final HomeProductsModel products;
  final VoidCallback? onTap;
  final VoidCallback onPaymentSuccess;
  final bool isFavorite;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetailsScreen, extra: products);
      },
      child: Card(
        color: AppColors.kWhiteColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    child: CustomCachedImage(
                      url:
                          products.productImage ??
                          "https://www.freepik.com/free-vector/no-data-concept-illustration_5928293.htm#fromView=search&page=1&position=17&uuid=c0ce15ec-bf97-450b-a81a-1bc1417ae153&query=no+image+found",
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${products.productSale}% OFF",
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
              HeightSpacer(height: 5),
              Row(
                children: [
                  WidthSpacer(width: 10),
                  Text(
                    products.productName ?? "No Name",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(
                      Icons.favorite,
                      size: 25.sp,
                      color:
                          isFavorite
                              ? AppColors.kPrimaryColor
                              : AppColors.kGreyColor,
                    ),
                  ),
                  WidthSpacer(width: 10),
                ],
              ),
              Row(
                children: [
                  WidthSpacer(width: 10),
                  Column(
                    children: [
                      Text(
                        "${products.productNewPrice} LE",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "${products.productOldPrice} LE",
                        style: TextStyle(
                          fontSize: 15.sp,
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    textButton: textButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PaymentView(
                                onPaymentSuccess: onPaymentSuccess,
                                onPaymentError: () {
                                  log("Payment Failure");
                                },
                                price: double.parse(
                                  products.productNewPrice!,
                                ), // Required: Total price (e.g., 100 for 100 EGP)
                              ),
                        ),
                      );
                    },
                  ),
                  WidthSpacer(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
