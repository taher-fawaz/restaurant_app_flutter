import 'package:flutter/foundation.dart';

class Meal with ChangeNotifier {
  final String? id;
  final List<String>? categories;
  final String? title;
  final String? imageUrl;
  final String? ingredients;
  final int? numberOfRating;
  final double? price;
  final int? duration;
  final double? rating;
  final bool? isGlutenFree;
  bool? isFavourite;
  final bool? isVegan;
  final bool? isVegetarian;
  Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.numberOfRating,
    @required this.price,
    @required this.duration,
    @required this.rating,
    this.isGlutenFree,
    this.isFavourite = false,
    this.isVegan,
    this.isVegetarian,
  });
  void toggleFavouriteStatus() {
    isFavourite = !isFavourite!;
    notifyListeners();
  }
}
