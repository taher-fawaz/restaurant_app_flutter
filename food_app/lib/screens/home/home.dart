import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../provider/cart.dart';
import '../cart/cart_page.dart';
import 'components/best_food_carousel.dart';
import '../categories/components/category_list.dart';

import '../categories/categories_screen.dart';
import 'components/popular_foods_widget.dart';
import '../meals_screen/meal_screen.dart';
import 'widgets/build_headline_row.dart';
import '../../util/animation/scale_route.dart';
import '../../widgets/menu_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GlobalKey<SliderMenuContainerState> _key;
  @override
  void initState() {
    _key = GlobalKey<SliderMenuContainerState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderMenuContainer(
      appBarColor: Colors.white,
      key: _key,
      sliderMenuOpenSize: 200,
      title: const Text(
        "MEEZA",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
      ),
      sliderMenu: MenuWidget(
        onItemClick: (title) {
          _key.currentState!.closeDrawer();
          setState(() {
            // this.title = title;
          });
        },
      ),
      sliderMain: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
          title: const Text(
            "What would you like to eat?",
            style: TextStyle(
                color: Color(0xFF3a3737),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          actions: <Widget>[
            Stack(
              children: [
                Consumer<Cart>(builder: (context, value, ch) {
                  return Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    badgeColor: Theme.of(context).colorScheme.secondary,
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      value.itemCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }),
                IconButton(
                    icon: const Icon(
                      Icons.shopping_basket,
                      color: Color(0xFF3a3737),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, ScaleRoute(page: const CartScreen()));
                    }),
              ],
            )
          ],
        ),
        // appBar: const SearchBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20.0),
              const HeadlineRow(
                headlineTitle: 'Popular Now',
                page: MealsScreen.routeName,
              ),
              const SizedBox(height: 10.0),
              const PopularFoodsWidget(),
              // const SizedBox(height: 10.0),
              const HeadlineRow(
                headlineTitle: 'Category',
                page: CategoriesScreen.routeName,
              ),
              // const SizedBox(height: 10.0),
              Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Color(0xFFE9CFCF),
                      blurRadius: 15.0,
                      offset: Offset(0, .75),
                    ),
                  ]),
                  child: const CategoryList()),
              const SizedBox(height: 20.0),
              const HeadlineRow(
                headlineTitle: 'Best Foods',
                page: MealsScreen.routeName,
              ),
              const SizedBox(height: 10.0),
              const BestFoodCarouselSlider(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
