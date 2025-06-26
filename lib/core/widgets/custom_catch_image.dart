import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder:
            (context, url) => SizedBox(
              height: 100.h,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
        errorWidget:
            (context, url, error) =>
                Icon(Icons.error, color: AppColors.kRedColor),
      ),
    );
  }
}
