import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController textController;
  const UsernameTextField(this.textController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        labelText: 'username',
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
