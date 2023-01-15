import 'package:flutter/material.dart';
import 'package:food_menu/src/models/menu_model/menu_model.dart';

class CategoryButtonController extends ChangeNotifier {
  int selectedIndex = 0;
  List<Product>? product = [];

  setSelectedIndex(int index) {
    selectedIndex = index;

    notifyListeners();
  }
}
