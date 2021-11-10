import 'package:flutter/cupertino.dart';
import '../model/category.dart';

class Categories with ChangeNotifier {
  final List<Category> _categories = [
    Category(
      id: 'c1',
      title: 'Italian',
      imageUrl: "assets/food1.jpeg",
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      imageUrl: "assets/food2.jpeg",
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      imageUrl: "assets/food3.jpeg",
    ),
    Category(
      id: 'c4',
      title: 'German',
      imageUrl: "assets/food4.jpeg",
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      imageUrl: "assets/food5.jpeg",
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      imageUrl: "assets/food6.jpeg",
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      imageUrl: "assets/food1.jpeg",
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      imageUrl: "assets/food2.jpeg",
    ),
    Category(
      id: 'c9',
      title: 'French',
      imageUrl: "assets/food3.jpeg",
    ),
  ];
  // * for getting copy of category
  List<Category> get categories => [..._categories];
  Category findCategoryById(String categoryId) {
    return _categories.firstWhere((category) => category.id == categoryId);
  }
}
