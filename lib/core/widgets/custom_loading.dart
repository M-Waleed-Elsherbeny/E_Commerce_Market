import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          color: color ?? AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
