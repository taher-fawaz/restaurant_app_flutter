import 'package:flutter/material.dart';
import '../../../provider/cart.dart';
import 'package:provider/provider.dart';

class AddToCartMenu extends StatelessWidget {
  final bool? isDetailsPage;
  final String? id;
  final double? width;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final String? text;
  const AddToCartMenu(
    this.onTap, {
    this.id,
    Key? key,
    this.width,
    this.fontSize = 16,
    this.text = 'Add To Bag',
    this.isDetailsPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: !isDetailsPage!,
            child: Consumer<Cart>(builder: (context, value, ch) {
              return IconButton(
                onPressed: () {
                  final productId = value.findProductById(id!);
                  value.reduceCartItemByOne(productId.id!);
                },
                icon: const Icon(Icons.remove),
                color: Colors.black,
                iconSize: 30,
              );
            }),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: width,
              height: 45.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  text!,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isDetailsPage!,
            child: Consumer<Cart>(builder: (context, value, ch) {
              return IconButton(
                onPressed: () {
                  final productId = value.findProductById(id!);
                  value.addCartItem(productId.id!, productId.productName!,
                      productId.productImage!, productId.price!);
                },
                icon: const Icon(Icons.add),
                color: Theme.of(context).colorScheme.secondary,
                iconSize: 30,
              );
            }),
          ),
        ],
      ),
    );
  }
}
