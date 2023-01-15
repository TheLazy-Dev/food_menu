import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartController>(context, listen: true);
    return Visibility(
      visible: cart.getTotalCost() > 0,
      child: Container(
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 2,
                    child: Text('Total Items: ${cart.getTotalItems()}')),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, "/cart"),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.sp,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(FontAwesomeIcons.indianRupeeSign),
                            Text(
                              '${cart.getTotalCost()}',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.sp,
            )
          ],
        ),
      ),
    );
  }
}
