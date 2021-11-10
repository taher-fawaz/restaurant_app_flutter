import 'package:flutter/material.dart';
import '../../provider/meals.dart';
import 'widgets/full_meal_item.dart';
import '../home/widgets/search_card.dart';
import 'package:provider/provider.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/MealsScreen';
  const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "All Meals",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontWeight: FontWeight.w700,
              fontSize: 25),
        ),
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
