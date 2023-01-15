import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:food_menu/src/providers/category_button_controller.dart';
import 'package:food_menu/src/providers/isFirstTime/splash_provider.dart';
import 'package:food_menu/src/providers/menu_provider/menu_provider.dart';
import 'package:food_menu/src/screens/cart/cart_main.dart';
import 'package:food_menu/src/screens/splash/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SplashProvider()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: ((context) => MenuProvider()),
          lazy: true,
        ),
        ChangeNotifierProvider(
            create: ((context) => CategoryButtonController())),
        ChangeNotifierProvider(
            create: ((context) => CartController(products: [])))
      ],
      builder: (context, child) => ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: true,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routes: {
                "/": (context) => const SplashScreen(),
                "/cart": (context) => const Cart()
              },
            );
          }),
    );
  }
}
