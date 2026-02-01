import 'package:flutter/material.dart';
import '../models/cake.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cake> _items = {};

  Map<String, Cake> get items => _items;

  void addItem(Cake cake) {
    _items[cake.id] = cake;
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void increaseQuantity(String id) {
    if (!_items.containsKey(id)) return;
    _items[id]!.quantity = _items[id]!.quantity + 1;
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    if (!_items.containsKey(id)) return;

    final current = _items[id]!;
    if (current.quantity > 1) {
      current.quantity = current.quantity - 1;
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  double get total {
    double sum = 0.0;
    _items.forEach((key, item) {
      sum += item.price * item.quantity;
    });
    return sum;
  }

  int get count => _items.length;

  void clearData() {
    items.clear();
    notifyListeners();
  }
}
