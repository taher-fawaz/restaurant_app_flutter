import 'package:flutter/material.dart';
import '../cart_page.dart';

class CartIconWithBadge extends StatelessWidget {
  final VoidCallback? onPressed;
  const CartIconWithBadge({Key? key, this.onPressed, this.counter = 0})
      : super(key: key);

  final int? counter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.business_center,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            }),
        counter != 0
            ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container(
                // color: Colors.green,
                // width: 100,
                // height: 100,
                )
      ],
    );
  }
}
