import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_e_commerce_app/core/colors/app_colors.dart';
import 'package:my_e_commerce_app/core/paymob_payment/paymob_configuration.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class PaymentInitialize {
  static paymentInit({Style? style, UserData? userData}) {
    PaymentData.initialize(
      apiKey:
          paymentApiKey, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
      iframeId: iframeId, // Required: Found under Developers -> iframes
      integrationCardId:
          integrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
      integrationMobileWalletId:
          integrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID
      // Optional User Data
      userData:
          userData ??
          UserData(
            email: "User Email", // Optional: Defaults to 'NA'
            phone: "User Phone", // Optional: Defaults to 'NA'
            name: "User First Name", // Optional: Defaults to 'NA'
            lastName: "User Last Name", // Optional: Defaults to 'NA'
          ),

      // Optional Style Customizations
      style:
          style ??
          Style(
            appBarBackgroundColor: AppColors.kPrimaryColor,
            appBarForegroundColor: AppColors.kScaffoldColor,
            circleProgressColor: AppColors.kPrimaryColor,
            primaryColor: AppColors.kPrimaryColor,
            scaffoldColor: AppColors.kScaffoldColor,
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              elevation: 100,
              foregroundColor: AppColors.kScaffoldColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
            ),
          ),
    );
  }
}
