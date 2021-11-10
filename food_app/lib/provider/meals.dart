import 'package:flutter/cupertino.dart';
import '../model/meal.dart';

class Meals with ChangeNotifier {
  final List<Meal> _meals = [
    Meal(
      id: "a1",
      categories: [
        'c1',
        'c2',
      ],
      title: "Fried Egg",
      imageUrl: "assets/images/popular_foods/ic_popular_food_1.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 15,
      isVegetarian: false,
    ),
    Meal(
      id: "a2",
      categories: [
        'c2',
        'c3',
      ],
      title: "Mixed Vegetable",
      imageUrl: "assets/images/popular_foods/ic_popular_food_3.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 20,
      isVegetarian: false,
    ),
    Meal(
      id: "a3",
      categories: [
        'c3',
        'c4',
      ],
      title: "Salad With Chicken",
      imageUrl: "assets/images/popular_foods/ic_popular_food_4.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 30,
      isVegetarian: false,
    ),
    Meal(
      id: "a4",
      categories: [
        'c5',
        'c6',
      ],
      title: "Mixed Salad",
      imageUrl: "assets/images/popular_foods/ic_popular_food_5.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 12,
      isVegetarian: false,
    ),
    Meal(
      id: "a5",
      categories: [
        'c7',
        'c8',
      ],
      title: "Red meat,Salad",
      imageUrl: "assets/images/popular_foods/ic_popular_food_2.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 22,
      isVegetarian: false,
    ),
    Meal(
      id: "a6",
      categories: [
        'c8',
      ],
      title: "Potato,Meat fry",
      imageUrl: "assets/images/popular_foods/ic_popular_food_6.png",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      numberOfRating: 200,
      price: 40,
      isVegetarian: false,
    ),
    Meal(
      id: 'm1',
      price: 80,
      numberOfRating: 100,
      categories: [
        'c1',
        'c2',
      ],
      title: 'Spaghetti with Tomato',
      imageUrl: "assets/food1.jpeg",
      duration: 20,
      rating: 4.5,
      ingredients:
          '4 Tomatoes, 1 Tablespoon of Olive Oil, 1 Onion, 250g Spaghetti, Spices, Cheese (optional)',
      isGlutenFree: false,
      isVegan: true,
      isVegetarian: true,
      isFavourite: true,
    ),
    Meal(
      id: 'm2',
      price: 30,
      numberOfRating: 100,
      categories: [
        'c7',
      ],
      title: 'Toast Hawaii',
      imageUrl: "assets/food2.jpeg",
      duration: 10,
      rating: 4.5,
      ingredients:
          '1 Slice White Bread, 1 Slice Ham, 1 Slice Pineapple, 1-2 Slices of Cheese, Butter',
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isFavourite: false,
    ),
    Meal(
      id: 'm3',
      price: 20,
      numberOfRating: 100,
      categories: [
        'c2',
        'c3',
      ],
      title: 'Classic Hamburger',
      imageUrl: "assets/food3.jpeg",
      duration: 45,
      rating: 4.5,
      ingredients:
          '300g Cattle Hack, 1 Tomato, 1 Cucumber, 1 Onion, Ketchup, 2 Burger Buns',
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isFavourite: true,
    ),
    Meal(
      id: 'm4',
      categories: [
        'c4',
      ],
      title: 'Wiener Schnitzel',
      imageUrl: "assets/food4.jpeg",
      duration: 60,
      rating: 4.5,
      ingredients:
          '8 Veal Cutlets, 4 Eggs, 200g Bread Crumbs, 100g Flour, 300ml Butter, 100g Vegetable Oil, Salt, Lemon Slices',
      price: 10,
      numberOfRating: 100,
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isFavourite: false,
    ),
    Meal(
      id: 'm5',
      categories: [
        'c2',
        'c5',
        'c10',
      ],
      title: 'Salad with Smoked Salmon',
      imageUrl: "assets/food5.jpeg",
      duration: 15,
      rating: 4.5,
      ingredients:
          'Arugula, Lamb\'s Lettuce, Parsley, Fennel, 200g Smoked Salmon, Mustard, Balsamic Vinegar, Olive Oil, Salt and Pepper',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isFavourite: true,
    ),
    Meal(
      id: 'm6',
      categories: [
        'c6',
        'c9',
      ],
      title: 'Delicious Orange Mousse',
      imageUrl: "assets/food6.jpeg",
      duration: 240,
      rating: 4.5,
      ingredients:
          '4 Sheets of Gelatine, 150ml Orange Juice, 80g Sugar, 300g Yoghurt, 200g Cream, Orange Peel',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isFavourite: false,
    ),
    Meal(
      id: 'm7',
      categories: [
        'c7',
      ],
      title: 'Pancakes',
      imageUrl: "assets/food7.jpeg",
      duration: 20,
      rating: 4.5,
      ingredients:
          '1 1/2 Cups all-purpose Flour, 3 1/2 Teaspoons Baking Powder, 1 Teaspoon Salt, 1 Tablespoon White Sugar, 1 1/4 cups Milk, 1 Egg, 3 Tablespoons Butter, melted',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isFavourite: false,
    ),
    Meal(
      id: 'm8',
      categories: [
        'c8',
      ],
      title: 'Creamy Indian Chicken Curry',
      imageUrl: "assets/food8.jpeg",
      duration: 35,
      rating: 4.5,
      ingredients:
          '4 Chicken Breasts, 1 Onion, 2 Cloves of Garlic, 1 Piece of Ginger, 4 Tablespoons Almonds, 1 Teaspoon Cayenne Pepper, 500ml Coconut Milk',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: false,
      isFavourite: true,
    ),
    Meal(
      id: 'm9',
      categories: [
        'c9',
      ],
      title: 'Chocolate Souffle',
      imageUrl: "assets/food9.jpeg",
      duration: 45,
      rating: 4.5,
      ingredients:
          '1 Teaspoon melted Butter, 2 Tablespoons white Sugar, 2 Ounces 70% dark Chocolate, broken into pieces, 1 Tablespoon Butter, 1 Tablespoon all-purpose Flour, 4 1/3 tablespoons cold Milk, 1 Pinch Salt, 1 Pinch Cayenne Pepper, 1 Large Egg Yolk, 2 Large Egg Whites, 1 Pinch Cream of Tartar, 1 Tablespoon white Sugar',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: true,
      isFavourite: false,
    ),
    Meal(
      id: 'm10',
      categories: [
        'c2',
        'c5',
        'c9',
      ],
      title: 'Asparagus Salad ',
      imageUrl: "assets/food1.jpeg",
      duration: 30,
      rating: 4.5,
      ingredients:
          'White and Green Asparagus, 30g Pine Nuts, 300g Cherry Tomatoes, Salad, Salt, Pepper and Olive Oil',
      price: 50,
      numberOfRating: 100,
      isGlutenFree: true,
      isVegan: true,
      isVegetarian: true,
      isFavourite: true,
    ),
  ];
  List<Meal> get meals => [..._meals];
  Iterable<Meal> findMealsByCategory(String categoryId) {
    return _meals.where((meal) => meal.categories!.contains(categoryId));
  }
}
