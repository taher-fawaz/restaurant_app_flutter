import 'package:flutter/material.dart';
import '../../../model/category.dart';
import '../../category/meal_by_category_screen.dart';
import 'package:provider/provider.dart';

class CategoryItemFull extends StatelessWidget {
  const CategoryItemFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size;

    final category = Provider.of<Category>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
            context, MealsByCategoryScreen.routeName,
            arguments: category.id),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: <Widget>[
              Image.asset(
                category.imageUrl,
                height: sized.height,
                width: sized.height,
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
                height: sized.height,
                width: sized.height,
              ),
              Center(
                child: Container(
                  height: sized.height,
                  width: sized.height,
                  padding: const EdgeInsets.all(1),
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
