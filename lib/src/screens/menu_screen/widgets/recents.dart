import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/common/fonts/common_fonts.dart';
import 'package:food_menu/src/providers/cart_controller/cart_controller.dart';
import 'package:provider/provider.dart';
import '../../../models/menu_model/menu_model.dart';
import '../../../providers/cart_controller/cart_controller.dart' as cart;

class RecentProducts extends StatelessWidget {
  const RecentProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: cart.CartController(products: []).fetchRecents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final recentProducts = snapshot.data;
          return Visibility(
              child: Row(
            children: recentProducts!.map((product) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductListingAddorRemoveListTile(product: product),
              );
            }).toList(),
          ));
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error Fetching Recents'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
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
