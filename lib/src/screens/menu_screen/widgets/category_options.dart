import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_menu/src/providers/category_button_controller.dart';
import 'package:food_menu/src/providers/menu_provider/menu_provider.dart';
import 'package:provider/provider.dart';

class FoodCategoryRow extends StatelessWidget {
  const FoodCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context, listen: true);
    final List<IconData> iconsList = [
      FontAwesomeIcons.pizzaSlice,
      FontAwesomeIcons.burger,
      FontAwesomeIcons.wheatAwn,
      FontAwesomeIcons.iceCream,
      FontAwesomeIcons.egg,
      FontAwesomeIcons.candyCane
    ];
    final categoryList = menuProvider.categoryTitles;
    return Consumer<MenuProvider>(
        builder: (context, category, _) => SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FoodCategoryOption(
                  icon: iconsList[index],
                  index: index,
                  optionText: categoryList[index]),
              itemCount: categoryList.length,
            )));
  }
}

class FoodCategoryOption extends StatefulWidget {
  const FoodCategoryOption(
      {super.key,
      required this.icon,
      required this.index,
      required this.optionText});

  final IconData icon;
  final String optionText;
  final int index;

  @override
  State<FoodCategoryOption> createState() => _FoodCategoryOptionState();
}

class _FoodCategoryOptionState extends State<FoodCategoryOption> {
  @override
  Widget build(BuildContext context) {
    final menuItemList = Provider.of<MenuProvider>(context, listen: false);
    final buttonController =
        Provider.of<CategoryButtonController>(context, listen: true);
    int selectedIndex = buttonController.selectedIndex;
    return Consumer(builder: (context, empty, _) {
      return InkWell(
        onTap: () {
          buttonController.setSelectedIndex(widget.index);
          menuItemList.getMenuFromCategory(widget.optionText);
        },
        child: Container(
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.only(left: 10.sp),
          height: 35.h,
          decoration: BoxDecoration(
              color:
                  selectedIndex == widget.index ? Colors.yellow : Colors.white,
              border: Border.all(
                color: selectedIndex == widget.index
                    ? Colors.yellow
                    : Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon),
              SizedBox(width: 10.w),
              Text(widget.optionText)
            ],
          ),
        ),
      );
    });
  }
}
