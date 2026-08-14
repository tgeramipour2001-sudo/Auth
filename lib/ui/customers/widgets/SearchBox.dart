import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/widget/search_bar.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchCustomerController;
  final ValueChanged<String> searchChanged;
  const SearchBox({
    super.key,
    required this.searchChanged,
    required this.searchCustomerController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 100,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(blurRadius: 2)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SearchTextField(
              searchCustomerController: searchCustomerController,
              searchChanged: searchChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(CupertinoIcons.search, size: 20, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
