import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import '../../../provider/meals.dart';
import '../../food_details/food_details_page.dart';
import '../../../util/animation/scale_route.dart';
import 'package:provider/provider.dart';

class BestFoodCarouselSlider extends StatelessWidget {
  const BestFoodCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<Meals>(context).meals;
    return Container(
      padding: const EdgeInsets.all(10),
      height: 400,
      width: 500,
      child: CarouselSlider.builder(
          // key: _sliderKey,
          unlimitedMode: true,
          slideBuilder: (index) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      ScaleRoute(page: FoodDetailsPage(id: meals[index].id)),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        meals[index].imageUrl!,
                        height: 300,
                        width: 300,
                        fit: BoxFit.fitWidth,
                      )),
                ),
                Text(
                  meals[index].title!,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 40,
                      overflow: TextOverflow.fade,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
          slideTransform: const CubeTransform(),
          slideIndicator: CircularSlideIndicator(
            padding: const EdgeInsets.only(bottom: 32),
          ),
          itemCount: meals.length),
    );
  }
}
