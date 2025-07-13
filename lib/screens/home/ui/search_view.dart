import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/core/widgets/card_items.dart';
import 'package:my_e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:my_e_commerce_app/core/widgets/height_spacer.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Search Screen"),
      body: ListView(
        children: [
          HeightSpacer(height: 20),
          ProductCardItems(query: query,),
        ],
      ),
    );
  }
}