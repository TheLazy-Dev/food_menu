import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  bool isFirstTime = false;
  splashCalled() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isFirstTime = sp.getBool("isFirstTime") ?? true;
    notifyListeners();
  }

  splashDone() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("isFirstTime", false);
    notifyListeners();
  }
}
