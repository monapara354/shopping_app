import 'package:flutter/material.dart';

import './chart.dart';

class OrderItem {
  final String id;
  final double total;
  final List<ChartItem> cartProduct;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.total,
      required this.cartProduct,
      required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

//
  void addOrder(List<ChartItem> products, double total) {
    _order.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            total: total,
            cartProduct: products,
            dateTime: DateTime.now()));

    notifyListeners();
  }
}
