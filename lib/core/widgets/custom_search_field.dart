import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String labelText;
  final Widget? suffixIcon;
  const CustomSearchField({
    super.key,
    required this.labelText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      cursorColor: AppColors.kPrimaryColor,
      style: TextStyle(fontSize: 15, color: AppColors.kGreyColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kWhiteColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: suffixIcon,
        label: Text(
          labelText,
          style: TextStyle(fontSize: 15, color: AppColors.kGreyColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBorderSideColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
