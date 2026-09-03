import 'package:flutter/material.dart';

class ProductListViewBottom extends StatelessWidget {
   final Color containerColor = Color(0xff204680);
   ProductListViewBottom({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 90,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: containerColor,
      boxShadow: [BoxShadow(blurRadius: 5)]),
      child: Row(children: [],),
      );
  }
}
