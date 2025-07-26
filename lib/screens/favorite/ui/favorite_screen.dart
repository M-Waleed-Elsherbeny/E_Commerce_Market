import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Favorites Products", canPop: false),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [ProductCardItems(isFavoriteScreen: true)]),
        ),
      ),
    );
  }
}
