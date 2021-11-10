import 'package:flutter/material.dart';
import 'popular_meals.dart';

class PopularFoodsWidget extends StatelessWidget {
  const PopularFoodsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Column(
        children: const <Widget>[
          // PopularFoodTitle(),
          Expanded(
            child: PopularFoodItems(),
          )
        ],
      ),
    );
  }
}
