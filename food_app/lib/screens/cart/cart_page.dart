import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/cart.dart';
import '../order/orders_screen.dart';
import 'components/payment_method.dart';
import 'widgets/cart_badge.dart';
import 'widgets/cart_item_widget.dart';
import 'widgets/promo_code.dart';
import 'widgets/total_calculation.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/CartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cartItems = Provider.of<Cart>(context);
    final List cartList = cartItems.cartItems.values.toList();
    return Scaffold(
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
          title: const Center(
            child: Text(
              "Item Carts",
              style: TextStyle(
                  color: Color(0xFF3a3737),
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        "Your Food Cart",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF3a3a3b),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      label: Text(
                        "Total Amount: \$${cartItems.totalAmount}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: cartItems.cartItems.length < 3
                      ? cartItems.cartItems.length * 130
                      : 250,
                  child: ListView.builder(
                    itemCount: cartItems.cartItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return CartItemWidget(
                          id: cartList[i].id,
                          productName: cartList[i].productName,
                          productImage: cartList[i].productImage,
                          productCartQuantity: cartList[i].quantity.toString(),
                          productPrice: cartList[i].price.toString());
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PromoCodeWidget(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: cartItems.cartItems.length,
                    itemBuilder: (BuildContext context, int i) {
                      return TotalCalculationWidget(
                        productName: cartList[i].productName,
                        price: cartList[i].price,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text(
                    "Payment Method",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3a3a3b),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentMethodWidget(
                  text: "Credit/Debit Card",
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentMethodWidget(
                  text: "Cash on Delivery",
                  image: "assets/icons/cash.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    cartItems.clearCart();
                    Navigator.pushNamed(context, OrdersScreen.routeName);
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
