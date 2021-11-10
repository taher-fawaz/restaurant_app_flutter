import 'package:flutter/cupertino.dart';

class CartItem {
  final String? id;
  final String? productName;
  final String? productImage;
  final int? quantity;
  final double? price;

  CartItem(
      this.id, this.productName, this.productImage, this.quantity, this.price);
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems => {..._cartItems};
  int get itemCount => _cartItems.length;

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
    });
    return total;
  }

  void addCartItem(
    String productId,
    String productName,
    String productImage,
    double price,
  ) {
    if (_cartItems.containsKey(productId)) {
      // inrease product quantity
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              existingCartItem.id,
              existingCartItem.productName,
              existingCartItem.productImage,
              existingCartItem.quantity! + 1,
              existingCartItem.price));
    } else {
      _cartItems.putIfAbsent(productId,
          () => CartItem(productId, productName, productImage, 1, price));
    }
    notifyListeners();
  }

  CartItem findProductById(String mealId) {
    return _cartItems.values.toList().firstWhere((cart) => cart.id == mealId);
  }

  void reduceCartItemByOne(String productId) {
    _cartItems.update(
        productId,
        (existingCartItem) => existingCartItem.quantity! > 1
            ? CartItem(
                existingCartItem.id,
                existingCartItem.productName,
                existingCartItem.productImage,
                existingCartItem.quantity! - 1,
                existingCartItem.price)
            : CartItem(
                existingCartItem.id,
                existingCartItem.productName,
                existingCartItem.productImage,
                existingCartItem.quantity!,
                existingCartItem.price));
    notifyListeners();
  }

  void removeCartItem(String productID) {
    _cartItems.remove(productID);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    if (_cartItems[productId]!.quantity! > 1) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              existingCartItem.id,
              existingCartItem.productName,
              existingCartItem.productImage,
              existingCartItem.quantity! - 1,
              existingCartItem.price));
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
