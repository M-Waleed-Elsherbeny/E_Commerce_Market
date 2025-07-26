import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(child: Column(children: [ProductCardItems(isSoldScreen: true,)])),
        ),
      ),
    );
  }
}
