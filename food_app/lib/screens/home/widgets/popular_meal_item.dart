import 'package:flutter/material.dart';
import '../../../model/meal.dart';
import '../../../provider/cart.dart';
import '../../food_details/food_details_page.dart';
import '../../../util/animation/scale_route.dart';
import 'package:provider/provider.dart';

class PopularMealItem extends StatelessWidget {
  const PopularMealItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = Provider.of<Meal>(
      context,
    );
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
          // decoration: BoxDecoration(boxShadow: [
          //   BoxShadow(
          //     color: Theme.of(context).colorScheme.secondary.withOpacity(.05),
          //     // color: Color(0xFFfae3e2),
          //     blurRadius: 15.0,
          //     offset: Offset(0, 0.75),
          //   ),
          // ]),
          child: Card(
              color: Colors.white,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: SizedBox(
                width: 170,
                height: 210,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: const EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      meal.toggleFavouriteStatus();
                                    },
                                    icon: Icon(
                                      meal.isFavourite!
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: const Color(0xFFff0654),
                                      size: 26,
                                    )),
                              ),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Center(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                ScaleRoute(
                                  page: FoodDetailsPage(id: meal.id),
                                ),
                              );
                            },
                            child: Image.asset(
                              meal.imageUrl!,
                              width: 130,
                              height: 140,
                            ),
                          )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 130,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: Text(meal.title!,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Color(0xFF6e6e71),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                              height: 28,
                              width: 28,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFfae3e2),
                                      blurRadius: 25.0,
                                      offset: Offset(0.0, 0.75),
                                    ),
                                  ]),
                              child:
                                  Consumer<Cart>(builder: (context, value, ch) {
                                return IconButton(
                                  onPressed: () {
                                    value.addCartItem(meal.id!, meal.title!,
                                        meal.imageUrl!, meal.price!);
                                    ScaffoldMessenger.of(context)
                                      ..removeCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            "${meal.title!} has been added to your cart",
                                          ),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          duration: const Duration(seconds: 2),
                                          action: SnackBarAction(
                                              label: "UNDO",
                                              textColor: Colors.white,
                                              onPressed: () {
                                                value
                                                    .removeSingleItem(meal.id!);
                                              }),
                                        ),
                                      );
                                  },
                                  padding: const EdgeInsets.only(right: 10),
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 26,
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text(meal.rating!.toString(),
                                  style: const TextStyle(
                                      color: Color(0xFF6e6e71),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 3, left: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                    width: 50,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Icon(
                                          Icons.star,
                                          size: 10,
                                          color: i == 4
                                              ? const Color(0xFF9b9b9c)
                                              : const Color(0xFFfb3132),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              child: Text("(${meal.numberOfRating})",
                                  style: const TextStyle(
                                      color: Color(0xFF6e6e71),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding:
                              const EdgeInsets.only(left: 5, top: 5, right: 5),
                          child: Text('\$${meal.price}',
                              style: const TextStyle(
                                  color: Color(0xFF6e6e71),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
