import 'package:flutter/services.dart';

getMenuFromJson() async {
  final response = await rootBundle
      .loadString('assets/json/menu.json')
      .then((value) => value);
  return response;
}
