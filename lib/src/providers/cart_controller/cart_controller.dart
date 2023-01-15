import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_menu/src/models/menu_model/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends ChangeNotifier {
  final List<Product> products;
  final Map<Product, int> productQuantities;
  int quantity = 0;
  int totalPrice = 0;

  CartController({required this.products})
      : productQuantities = {for (var p in products) p: 0};

  void addProduct(Product product, int quantity) {
    if (productQuantities.containsKey(product)) {
      productQuantities[product] = productQuantities[product]! + 1;
    } else {
      productQuantities[product] = 1;
    }
    notifyListeners();
  }

  void increaseQuantity() {
    quantity++;

    notifyListeners();
  }

  void decreaseQuantity() {
    quantity--;

    notifyListeners();
  }

  void removeProduct(Product product, int quantity) {
    if (productQuantities.containsKey(product)) {
      if (productQuantities[product]! > 1) {
        productQuantities[product] = (productQuantities[product]! - 1);
      } else {
        productQuantities.remove(product);
      }
      notifyListeners();
    }
  }

  int? getProductQuantity(Product product) {
    if (productQuantities[product] != null) {
      return productQuantities[product];
    }
    return 0;
  }

  List<Product> getAllProducts() {
    return products;
  }

  Map<Product, int> getProductQuantities() {
    return productQuantities;
  }

  int getTotalItems() {
    int totalItems = 0;
    productQuantities.forEach((product, quantity) {
      totalItems += quantity;
    });
    return totalItems;
  }

  int getTotalCost() {
    int totalCost = 0;
    productQuantities.forEach((product, quantity) {
      totalCost += product.price * quantity;
    });
    return totalCost;
  }

  void checkout() {
    // other checkout logic

    // save the most recent 3 products
    final mostRecent =
        List.from(productQuantities.keys).toList() as List<Product>;
    saveRecentProducts(mostRecent);
  }

  void saveRecentProducts(List<Product> products) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final recentProductsJson =
        jsonEncode(products.map((product) => product.toJson()).toList());
    sp.setString('recentProducts', recentProductsJson);
  }

  Future<List<Product>> fetchRecents() async {
    final prefs = await SharedPreferences.getInstance();
    final recentProductsJson = prefs.getString('recentProducts');
    if (recentProductsJson == null) {
      return [];
    }
    final recentProductsListJson = jsonDecode(recentProductsJson) as List;
    return recentProductsListJson
        .map((item) => Product.fromJson(item))
        .toList();
  }
}
