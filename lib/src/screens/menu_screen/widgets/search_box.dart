import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [Icon(Icons.search), Text("Search")],
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)))),
    );
  }
}
