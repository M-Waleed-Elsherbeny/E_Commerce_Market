import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "favorite"),
      body: ListView(children: [HeightSpacer(height: 10), ProductCardItems(
        isFavoriteScreen: true,
      )]),
    );
  }
}
