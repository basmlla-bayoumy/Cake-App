import 'package:flutter/material.dart';
import '../models/cake.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Cake> _favorites = [];

  List<Cake> get favorites => _favorites;

  bool isFavorite(Cake cake) {
    return _favorites.any((c) => c.id == cake.id);
  }

  void toggleFavorite(Cake cake) {
    if (isFavorite(cake)) {
      _favorites.removeWhere((c) => c.id == cake.id);
    } else {
      _favorites.add(cake);
    }
    notifyListeners();
  }
}
