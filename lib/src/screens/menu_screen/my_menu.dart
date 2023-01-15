import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/common/fonts/common_fonts.dart';
import 'package:food_menu/src/screens/menu_screen/widgets/cart_bottom_sheet.dart';
import 'package:food_menu/src/screens/menu_screen/widgets/category_options.dart';
import 'package:food_menu/src/screens/menu_screen/widgets/item_list.dart';
import 'package:food_menu/src/screens/menu_screen/widgets/recents.dart';
import 'package:food_menu/src/screens/menu_screen/widgets/search_box.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              "Menu",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Food",
                    style: CommonFonts.mainScreenOptionSelected,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Offers",
                    style: CommonFonts.mainScreenOptionUnselected,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const SearchBox(),
            SizedBox(
              height: 20.h,
            ),
            const FoodCategoryRow(),
            const RecentProducts(),
            const Expanded(child: MenuItemList())
          ],
        ),
      ),
      bottomSheet: const CartBottomSheet(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
