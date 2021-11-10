import 'package:flutter/material.dart';
import '../../../provider/meals.dart';
import '../widgets/popular_meal_item.dart';
import 'package:provider/provider.dart';

class PopularFoodItems extends StatelessWidget {
  const PopularFoodItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int i) =>
            ChangeNotifierProvider.value(
              value: meals[i],
              child: const PopularMealItem(),
            ));
  }
}
