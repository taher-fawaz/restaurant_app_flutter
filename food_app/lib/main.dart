import 'package:flutter/material.dart';
import 'provider/cart.dart';
import 'provider/categories.dart';
import 'provider/meals.dart';
import 'provider/orders.dart';
import 'screens/cart/cart_page.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/category/meal_by_category_screen.dart';
import 'screens/food_details/food_details_page.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/meals_screen/meal_screen.dart';
import 'screens/order/orders_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'util/const.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Categories()),
        ChangeNotifierProvider(create: (ctx) => Meals()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        home: const MainScreen(),
        routes: {
          FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
          CategoriesScreen.routeName: (context) => const CategoriesScreen(),
          MealsScreen.routeName: (context) => const MealsScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          UserProfileScreen.routeName: (context) => const UserProfileScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          MealsByCategoryScreen.routeName: (context) =>
              const MealsByCategoryScreen()
        },
      ),
    );
  }
}
