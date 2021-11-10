import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../provider/cart.dart';
import '../cart/widgets/cart_badge.dart';
import 'components/build_friends_list.dart';
import '../../provider/meals.dart';

import '../cart/cart_page.dart';
import 'components/food_details_slider.dart';
import '../cart/widgets/add_cart_button.dart';
import 'components/bottom_menu.dart';
import '../../util/animation/scale_route.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatelessWidget {
  static const routeName = '/FoodDetailsPage';
  final String? id;
  const FoodDetailsPage({Key? key, this.id}) : super(key: key);

  // ignore: unused_field
  // int? _rating;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final meals =
        Provider.of<Meals>(context).meals.firstWhere((meal) => meal.id == id);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF3a3737),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          actions: <Widget>[
            Consumer<Cart>(
              builder: (context, value, ch) {
                return CartIconWithBadge(
                  counter: value.itemCount,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, ScaleRoute(page: const CartScreen()));
                  },
                );
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  meals.imageUrl!, fit: BoxFit.fill, height: 225,
                  // 'assets/images/bestfood/ic_best_food_8.jpeg',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                elevation: 1,
                margin: const EdgeInsets.all(5),
              ),

              FoodTitleWidget(
                productName: meals.title, productPrice: "\$${meals.price}",
                // productHost: 'pizza hut',
              ),
              // Rating((rating) {
              //   setState(() {
              //     _rating = rating;
              //   });
              // }, maximumRating: 5),
              // const SizedBox(
              //   height: 15,
              // ),
              AddToCartMenu(
                () {
                  cart.addCartItem(
                      meals.id!, meals.title!, meals.imageUrl!, meals.price!);
                },
                width: 200,
                isDetailsPage: true,
                fontSize: 20,
              ),

              PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Theme.of(context).colorScheme.secondary,
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  unselectedLabelColor: const Color(0xFFa4a1a1),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Food Details',
                    ),
                    Tab(
                      text: 'Food Reviews',
                    ),
                  ], // list of tabs
                ),
              ),
              SizedBox(
                height: 50,
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white24,
                      child: DetailContentMenu(
                        true,
                        content: meals.ingredients,
                      ),
                    ),
                    Container(
                      color: Colors.white24,
                      child: DetailContentMenu(false),
                    ), // class name
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
                width: double.infinity,
                child: FoodDetailsSlider(
                    slideImage1:
                        "assets/images/popular_foods/ic_popular_food_4.png",
                    slideImage2:
                        "assets/images/popular_foods/ic_popular_food_5.png",
                    slideImage3:
                        "assets/images/popular_foods/ic_popular_food_6.png"),
              ),
              const BottomMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodTitleWidget extends StatelessWidget {
  final String? productName;
  final String? productPrice;

  const FoodTitleWidget({
    Key? key,
    @required this.productName,
    @required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              productName!,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              productPrice!,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DetailContentMenu extends StatelessWidget {
  late bool isFoodDetails = true;
  final String? content;
  DetailContentMenu(this.isFoodDetails, {this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isFoodDetails
          ? Text(
              content!,
              style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  height: 1.50),
              textAlign: TextAlign.justify,
            )
          : const BuildFriendsList(),
    );
  }
}
