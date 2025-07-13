import 'package:flutter/material.dart';

class CategoriesModel {
  final IconData icon;
  final String categoryName;
  CategoriesModel({required this.icon, required this.categoryName});

  static List<CategoriesModel> get getCategories => [
    CategoriesModel(
      icon: Icons.phone_android_outlined,
      categoryName: 'Mobiles',
    ),
    CategoriesModel(icon: Icons.tv, categoryName: 'Electronics'),
    CategoriesModel(icon: Icons.sports, categoryName: 'Sports'),
    CategoriesModel(icon: Icons.collections, categoryName: 'Collections'),
    CategoriesModel(icon: Icons.book, categoryName: 'Books'),
    CategoriesModel(icon: Icons.games, categoryName: 'Games'),
  ];
}
