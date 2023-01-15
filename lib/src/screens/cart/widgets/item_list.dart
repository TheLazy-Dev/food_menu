import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/common/fonts/common_fonts.dart';
import 'package:food_menu/src/models/menu_model/menu_model.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:provider/provider.dart';

class ProductListingAddorRemoveListTile extends StatefulWidget {
  ProductListingAddorRemoveListTile(
      {super.key, required this.product, required this.quantity});

  final Product product;
  int quantity;

  @override
  State<ProductListingAddorRemoveListTile> createState() =>
      _ProductListingAddorRemoveListTileState();
}

class _ProductListingAddorRemoveListTileState
    extends State<ProductListingAddorRemoveListTile> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: true);
    return Visibility(
      visible: widget.product.instock,
      child: Card(
        shadowColor: Colors.blueGrey,
        child: ListTile(
          title: Text(widget.product.name),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(FontAwesomeIcons.indianRupeeSign, size: 15.sp),
              Text(
                "${widget.product.price}",
                style: CommonFonts.listTilePrice,
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    widget.quantity--;
                    cartController.removeProduct(
                        widget.product, widget.quantity);
                  });
                },
              ),
              Text(
                  "${widget.quantity < 0 ? widget.quantity = 0 : widget.quantity}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget.quantity++;
                    cartController.addProduct(widget.product, widget.quantity);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
