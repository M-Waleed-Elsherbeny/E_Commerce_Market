import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/functions/custom_snack_bar.dart';
import 'package:my_e_commerce_app/core/models/home_products_model.dart';
import 'package:my_e_commerce_app/core/routes/app_routes.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:my_e_commerce_app/core/widgets/custom_card_info.dart';
import 'package:my_e_commerce_app/core/widgets/custom_catch_image.dart';
import 'package:my_e_commerce_app/core/widgets/custom_loading.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';
import 'package:my_e_commerce_app/screens/auth/logic/cubit/authentication_cubit.dart';
import 'package:my_e_commerce_app/screens/auth/widgets/custom_text_field.dart';
import 'package:my_e_commerce_app/screens/products_details/logic/cubit/get_rate_cubit.dart';
import 'package:my_e_commerce_app/screens/products_details/widgets/user_comment.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productsModel});
  final HomeProductsModel productsModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
        context,
        widget.productsModel.productName ?? "Product Name",
      ),
      body: BlocProvider(
        create:
            (context) =>
                GetRatesAndCommentsCubit()
                  ..getRate(widget.productsModel.productId!),
        child: BlocConsumer<GetRatesAndCommentsCubit, GetRatesAndCommentsState>(
          listener: (context, state) {
            if (state is AddOrUpdateRateError) {
              customSnackBar(
                context,
                "Failed to add or update rate.",
                backgroundColor: Colors.red,
              );
            }
            if (state is AddCommentError) {
              customSnackBar(
                context,
                "Failed to add your comment.",
                backgroundColor: Colors.red,
              );
            }
            if (state is AddCommentSuccess) {
              customSnackBar(
                context,
                "Comment added successfully.",
                backgroundColor: Colors.green,
              );
            }
            if (state is AddOrUpdateRateSuccess) {
              context.pushReplacementNamed(
                AppRoutes.productDetailsScreen,
                extra: widget.productsModel,
              );
            }
          },
          builder: (context, state) {
            GetRatesAndCommentsCubit cubit =
                context.read<GetRatesAndCommentsCubit>();
            return state is GetRateLoading || state is AddCommentLoading
                ? CustomLoading()
                : ListView(
                  children: [
                    CustomCachedImage(url: widget.productsModel.productImage!),
                    HeightSpacer(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productsModel.productName ??
                                    "Product Name",
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${widget.productsModel.productNewPrice} LE", // Replace with your product price
                                style: TextStyle(fontSize: 24.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                Text(
                                  "${cubit.averageRate} ", // Replace with your product price
                                  style: TextStyle(fontSize: 24.sp),
                                ),
                                Icon(Icons.star, color: Colors.amber, size: 30),
                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border_outlined),
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ),
                          CustomCardInfo(
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              height: 150.h,
                              child: Center(
                                child: Text(
                                  widget.productsModel.productDescription ??
                                      "Product Description",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                          HeightSpacer(height: 10),
                          RatingBar.builder(
                            initialRating: cubit.userRates.toDouble(),
                            minRating: 0,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder:
                                (context, _) =>
                                    Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {
                              cubit.addOrUpdateRate(
                                productId: widget.productsModel.productId!,
                                rate: rating.toInt(),
                              );
                            },
                          ),
                          HeightSpacer(height: 10),
                          CustomTextFormField(
                            controller: commentController,
                            labelText: "Write a review",
                            suffixIcon: IconButton(
                              onPressed: () async {
                                await cubit.addComment({
                                  "comment": commentController.text,
                                  "user_id": cubit.userId,
                                  "product_id": widget.productsModel.productId,
                                  "user_name":
                                      context
                                          .read<AuthenticationCubit>()
                                          .userDataModel
                                          ?.name ??
                                      "Anonymous",
                                });
                                commentController.clear();
                                if (context.mounted) {
                                  context.pushReplacementNamed(
                                    AppRoutes.productDetailsScreen,
                                    extra: widget.productsModel,
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.send_outlined,
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ),
                          HeightSpacer(height: 15),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Comments",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          HeightSpacer(height: 10),
                          UserComment(productsModel: widget.productsModel),
                        ],
                      ),
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
