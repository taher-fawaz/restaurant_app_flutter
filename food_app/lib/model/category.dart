import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  final String? id;
  final String? title;
  final String imageUrl;

  Category({
    @required this.id,
    @required this.title,
    this.imageUrl = "assets/food1.jpeg",
  });
}
