import 'package:flutter/material.dart';

class CategoriesModel {
  final IconData icon;
  final String title;
  CategoriesModel({required this.icon, required this.title});

  static List<CategoriesModel> get getCategories => [
    CategoriesModel(icon: Icons.sports, title: 'Sports'),
    CategoriesModel(icon: Icons.tv, title: 'Electronics'),
    CategoriesModel(icon: Icons.collections, title: 'Collections'),
    CategoriesModel(icon: Icons.book, title: 'Books'),
    CategoriesModel(icon: Icons.games, title: 'Games'),
  ];
}
