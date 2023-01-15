import 'dart:convert';

Map<String, List<Product>> productFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Product>>(
        k, List<Product>.from(v.map((x) => Product.fromJson(x)))));

String productToJson(Map<String, List<Product>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Product {
  Product({
    required this.name,
    required this.price,
    required this.instock,
  });

  String name;
  int price;
  bool instock;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        price: json["price"],
        instock: json["instock"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "instock": instock,
      };
}

class Category {
  final String name;
  final List<Product> products;

  Category({required this.name, required this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    var products = json['products'] as List;
    List<Product> productList =
        products.map((i) => Product.fromJson(i)).toList();
    return Category(name: json['name'], products: productList);
  }
}

class Model {
  Map<String, List<Product>> data = {};

  Model.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      var products = value as List;
      List<Product> productList =
          products.map((i) => Product.fromJson(i)).toList();
      data[key] = productList;
    });
  }

  factory Model.fromJsonString(String jsonString) {
    return Model.fromJson(json.decode(jsonString));
  }
}
