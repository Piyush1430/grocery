import 'package:flutter/material.dart';

class ItemsModel {
  final String title;
  final String price;
  final String imagePath;
  final Color color;
   int quantity;

   ItemsModel(
      {required this.title,
      required this.price,
      required this.imagePath,
      this.quantity =1,
      this.color = Colors.orange});
}
