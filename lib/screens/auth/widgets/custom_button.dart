import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.textButton,
    this.onPressed,
  });
  final double? buttonWidth, buttonHeight;
  final String textButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(buttonWidth ?? 50, buttonHeight ?? 50),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        textButton,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kWhiteColor,
        ),
      ),
    );
  }
}
