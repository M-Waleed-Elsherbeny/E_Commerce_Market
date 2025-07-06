import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/cubit/get_products_cubit.dart';
import 'package:my_e_commerce_app/core/widgets/custom_catch_image.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/core/widgets/width_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_button.dart';
import 'package:my_e_commerce_app/screens/home/models/card_items_model.dart';

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

  @override
  Widget build(BuildContext context) {
    List products = context.read<GetProductsCubit>().products;

    return BlocProvider(
      create: (context) => GetProductsCubit()..getProducts(),
      child: GestureDetector(
        onTap: onTap,
        child: ListView.builder(
          shrinkWrap: isShrinkWrap ?? true,
          physics: physics ?? const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CardItems(
              index: index,
              cardItemsList: CardItemsModel.cardItems,
            );
          },
        ),
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({
    super.key,
    required this.cardItemsList,
    required this.index,
  });

  final List<CardItemsModel> cardItemsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  child: CustomCachedImage(url: cardItemsList[index].urlPath),
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
                    "${cardItemsList[index].discount}% OFF",
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
                  cardItemsList[index].title,
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
                      "${cardItemsList[index].priceAfter} LE",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${cardItemsList[index].priceBefore} LE",
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
    );
  }
}
