import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchCustomerController;
  final ValueChanged<String> searchChanged;
  const SearchTextField({
    super.key,
    required this.searchCustomerController,
    required this.searchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
       controller: searchCustomerController,
       onChanged: searchChanged,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        hintText: 'search',
        hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
