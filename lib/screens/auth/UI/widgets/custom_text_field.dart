import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? prefixIcon;
  final bool isPassword;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.kPrimaryColor,
      obscureText: isPassword,
      obscuringCharacter: "*",
      style: TextStyle(fontSize: 15, color: AppColors.kGreyColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        prefixIcon: prefixIcon,
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.kPrimaryColor,
                  ),
                )
                : null,
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
