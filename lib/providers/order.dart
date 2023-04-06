import 'package:flutter/material.dart';

import 'package:my_shop/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> prod;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.dateTime, this.prod);
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProd, double total) {
    _orders.insert(
      0,
      OrderItem(DateTime.now().toString(), total, DateTime.now(), cartProd),
    );
    notifyListeners();
  }
}
