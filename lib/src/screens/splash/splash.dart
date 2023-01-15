import 'package:flutter/material.dart';
import 'package:food_menu/src/providers/isFirstTime/splash_provider.dart';
import 'package:food_menu/src/providers/menu_provider/menu_provider.dart';
import 'package:food_menu/src/screens/menu_screen/my_menu.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final sprovider = Provider.of<SplashProvider>(context, listen: true);
    sprovider.splashCalled();
    bool isSplashCalled = sprovider.isFirstTime;
    return Consumer<SplashProvider>(
        builder: ((context, value, child) =>
            isSplashCalled ? const Scaffold() : const MyMenu()));
  }

  @override
  void initState() {
    final incomingMenuProvider =
        Provider.of<MenuProvider>(context, listen: false);
    final sprovider = Provider.of<SplashProvider>(context, listen: false);
    sprovider.splashDone();
    incomingMenuProvider.getMenuToModel();
    super.initState();
  }
}
