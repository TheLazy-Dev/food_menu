import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/common/fonts/common_fonts.dart';
import 'package:food_menu/src/models/menu_model/menu_model.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:food_menu/src/providers/menu_provider/menu_provider.dart';
import 'package:provider/provider.dart';

class MenuItemList extends StatefulWidget {
  const MenuItemList({super.key});

  @override
  State<MenuItemList> createState() => _MenuItemListState();
}

class _MenuItemListState extends State<MenuItemList> {
  @override
  Widget build(BuildContext context) {
    final itemListForCategory =
        Provider.of<MenuProvider>(context, listen: true);
    return Consumer(
        builder: ((context, value, child) => ListView.builder(
              itemBuilder: ((context, index) => Column(
                    children: [
                      ProductListingAddorRemoveListTile(
                        product:
                            itemListForCategory.productListFromCategory[index],
                      ),
                    ],
                  )),
              itemCount: itemListForCategory.productListFromCategory.length,
            )));
  }
}

class ProductListingAddorRemoveListTile extends StatefulWidget {
  const ProductListingAddorRemoveListTile({super.key, required this.product});

  final Product product;

  @override
  State<ProductListingAddorRemoveListTile> createState() =>
      _ProductListingAddorRemoveListTileState();
}

class _ProductListingAddorRemoveListTileState
    extends State<ProductListingAddorRemoveListTile> {
  int quantity = 0;

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
                    quantity--;
                    cartController.removeProduct(widget.product, quantity);
                  });
                },
              ),
              Text("${quantity < 0 ? quantity = 0 : quantity}"),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                    cartController.addProduct(widget.product, quantity);
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
