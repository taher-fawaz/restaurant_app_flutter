import 'package:flutter/material.dart';
import '../../../model/category.dart';
import '../../category/meal_by_category_screen.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  // final String? title;
  // final String? imageUrl;
  const CategoryItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, MealsByCategoryScreen.routeName,
          arguments: category.id),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: <Widget>[
              Image.asset(
                category.imageUrl,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.2, 0.7],
                    colors: [
                      Color.fromARGB(100, 0, 0, 0),
                      Color.fromARGB(100, 0, 0, 0),
                    ],
                    // stops: [0.0, 0.1],
                  ),
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.height / 6,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  padding: const EdgeInsets.all(1),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Center(
                    child: Text(
                      category.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
