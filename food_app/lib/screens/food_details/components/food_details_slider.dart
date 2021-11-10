import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FoodDetailsSlider extends StatelessWidget {
  final String? slideImage1;
  final String? slideImage2;
  final String? slideImage3;

  const FoodDetailsSlider(
      {Key? key,
      @required this.slideImage1,
      @required this.slideImage2,
      @required this.slideImage3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        child: CarouselSlider(
          items: [
            Image.asset(
              slideImage1!,
            ),
            Image.asset(
              slideImage2!,
            ),
            Image.asset(
              slideImage3!,
            ),
          ],
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
