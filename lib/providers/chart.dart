import 'dart:math';

import 'package:flutter/material.dart';

class ChartItem {
  final String id;
  final String title;
  final double price;
  final int qunitiy;

  ChartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.qunitiy});
}

class Chart with ChangeNotifier {
  Map<String, ChartItem> _cItem = {};

  Map<String, ChartItem> get cItem {
    return {..._cItem};
  }

  int get itemCount {
    return _cItem.length;
  }

  double get total {
    var total = 0.0;
    cItem.forEach((key, value) {
      total += value.price * value.qunitiy;
    });

    return total;
  }

  void addItem(String proId, String title, double price) {
    if (_cItem.containsKey(proId)) {
      _cItem.update(
          proId,
          (value) => ChartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qunitiy: value.qunitiy + 1));
    } else {
      _cItem.putIfAbsent(
          proId,
          () => ChartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qunitiy: 1));
    }

    notifyListeners();
  }

  void removeItem(String proId) {
    _cItem.remove(proId);
    notifyListeners();
  }

  // item undo
  void removeOne(String proId) {
    if (!_cItem.containsKey(proId)) {
      return;
    }
    if (cItem[proId]!.qunitiy > 1) {
      _cItem.update(
          proId,
          (value) => ChartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qunitiy: value.qunitiy - 1));
    } else {
      _cItem.remove(proId);
    }
    notifyListeners();
  }

  void clear() {
    _cItem = {};
    notifyListeners();
  }
}
