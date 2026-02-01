import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cake.dart';
class CakeProvider with ChangeNotifier {
  List<Cake> _cakes = [];
  bool loading = false;
  String? errorMessage;

  List<Cake> get cakes => _cakes;

  Future<void> fetchCakes() async {
    try {
      loading = true;
      errorMessage = null;
      

      final url = Uri.parse("https://692dc00ae5f67cd80a4cd3c3.mockapi.io/cakes/cakes");
      final response = await http.get(url);
      print(response.body);


      final data = json.decode(response.body);

      
      if (data is List) {
        _cakes = data.map((e) => Cake.fromJson(e)).toList();
      } else {
        _cakes = [];
      }
    } catch (e) {
      errorMessage = e.toString();
      _cakes = [];
    }

    loading = false;
    notifyListeners();
  }
}
