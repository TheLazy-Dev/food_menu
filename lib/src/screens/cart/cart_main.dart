import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:food_menu/src/screens/cart/widgets/item_list.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            )),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(
                child: Text(
              "Cart",
              style: TextStyle(color: Colors.black),
            )),
            Expanded(
                child: Icon(
              Icons.person,
              color: Colors.black,
            ))
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<CartController>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    itemCount: cart.productQuantities.length,
                    itemBuilder: (context, index) {
                      final product =
                          cart.productQuantities.keys.toList()[index];
                      return ProductListingAddorRemoveListTile(
                          product: product,
                          quantity: cart.productQuantities[product]!);
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 80.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer<CartController>(
                builder: (context, cart, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(FontAwesomeIcons.indianRupeeSign),
                          Text(
                            '${cart.getTotalCost()}',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Checkout/ Save Recents',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      // navigate to checkout page
                      cartController
                          .saveRecentProducts(cartController.getAllProducts());
                    },
                  ),
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
