import 'package:flutter/material.dart';
import 'package:food_menu/src/models/menu_model/menu_model.dart';
import 'package:food_menu/src/services/get_menu.dart';

class MenuProvider extends ChangeNotifier {
  bool isLoading = false;
  late Model productModel;
  List<String> categoryTitles = [];
  List<Product> productListFromCategory = [];
  getMenuToModel() async {
    isLoading = true;
    productModel = Model.fromJsonString(await getMenuFromJson());
    productModel.data.forEach((categoryName, value) {
      categoryTitles.add((categoryName));
    });
    isLoading = false;

    notifyListeners();
  }

  getMenuFromCategory(String category) {
    productListFromCategory = productModel.data[category] ?? [];

    notifyListeners();
  }
}
