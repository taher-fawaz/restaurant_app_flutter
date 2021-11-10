import 'package:flutter/material.dart';
import '../../../provider/cart.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String? id;

  final String? productName;
  final String? productPrice;
  final String? productImage;
  final String? productCartQuantity;

  const CartItemWidget({
    Key? key,
    this.id,
    @required this.productName,
    @required this.productPrice,
    @required this.productImage,
    @required this.productCartQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFFfae3e2).withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1),
        ),
      ]),
      child: Card(
          color: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                        child: Image.asset(
                      productImage!,
                      width: 110,
                      height: 100,
                    )),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                productName!,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              child: Text(
                                "\$$productPrice",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                            onTap: () => cart.removeCartItem(id!),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                "assets/images/menus/ic_delete.png",
                                width: 25,
                                height: 25,
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // color: Colors.amberAccent,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              final productId = cart.findProductById(id!);
                              cart.reduceCartItemByOne(productId.id!);
                            },
                            icon: const Icon(Icons.remove),
                            color: Colors.black,
                            iconSize: 30,
                          ),
                          Container(
                            width: 100,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                productCartQuantity!,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final productId = cart.findProductById(id!);
                              cart.addCartItem(
                                  productId.id!,
                                  productId.productName!,
                                  productId.productImage!,
                                  productId.price!);
                            },
                            icon: const Icon(Icons.add),
                            color: Theme.of(context).colorScheme.secondary,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
