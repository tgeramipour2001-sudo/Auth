
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: textController,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'search',
        hintStyle: TextStyle(
          color: Colors.black38,
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
    
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
    
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
