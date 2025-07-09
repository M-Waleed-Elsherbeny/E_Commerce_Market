import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/cubit/get_products_cubit.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/widgets/custom_catch_image.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/core/widgets/width_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:my_e_commerce_app/screens/products_details/ui/product_details_screen.dart';

class ProductCardItems extends StatelessWidget {
  const ProductCardItems({
    super.key,
    this.isShrinkWrap,
    this.physics,
    this.onTap,
  });
  final bool? isShrinkWrap;
  final ScrollPhysics? physics;
  final VoidCallback? onTap;
  // final List<HomeProductsModel>? products;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductsCubit>(
      create: (context) => GetProductsCubit()..getProducts(),
      child: BlocConsumer<GetProductsCubit, GetProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<HomeProductsModel> products =
              context.read<GetProductsCubit>().products;
          return state is GetProductsLoading
              ? CustomLoading()
              : ListView.builder(
                shrinkWrap: isShrinkWrap ?? true,
                physics: physics ?? const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return CardItems(products: products[index]);
                },
              );
        },
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.products});

  final HomeProductsModel products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(productsModel: products),
          ),
        );
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
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border_outlined, size: 25.sp),
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
                  CustomButton(textButton: "Buy Now", onPressed: () {}),
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
