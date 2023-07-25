import 'package:flutter/material.dart';

class ItemsModel {
  final String title;
  final String price;
  final String imagePath;
  final Color color;

  const ItemsModel(
      {required this.title,
      required this.price,
      required this.imagePath,
      this.color = Colors.orange});
}
