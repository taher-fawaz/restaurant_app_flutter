import 'package:flutter/material.dart';
import '../../model/category.dart';
import '../../model/meal.dart';
import '../../provider/categories.dart';
import '../../provider/meals.dart';
import '../meals_screen/widgets/full_meal_item.dart';
import '../home/widgets/search_card.dart';
import 'package:provider/provider.dart';

class MealsByCategoryScreen extends StatelessWidget {
  static const routeName = '/MealsByCategoryScreen';
  const MealsByCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String categoryId =
        ModalRoute.of(context)!.settings.arguments as String;
    final List<Meal> meals =
        Provider.of<Meals>(context).findMealsByCategory(categoryId).toList();
    final Category categories =
        Provider.of<Categories>(context).findCategoryById(categoryId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(categories.title!),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3a3737),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            const SearchCard(),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meals.length,
              itemBuilder: (BuildContext context, int i) {
                return FullMealItem(
                  id: meals[i].id,
                  img: meals[i].imageUrl,
                  title: meals[i].title,
                  ingredients: meals[i].ingredients,
                  rating: meals[i].rating.toString(),
                  // isVegetarian: meals[i].isVegetarian,
                );
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
