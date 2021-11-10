import 'package:flutter/cupertino.dart';
import 'cart.dart';

class Order {
  late String? id;
  late double? amount;
  late List<CartItem>? products;
  late DateTime? dateTime;
  Order({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<Order> _orders = [];
  List<Order> get orders => [..._orders];
  void addOrder(double totalAmount, List<CartItem> products) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: totalAmount,
            products: products,
            dateTime: DateTime.now()));
    notifyListeners();
  }
}
