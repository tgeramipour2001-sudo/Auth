
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController textController;
  const PasswordTextField(this.textController, {super.key});

  @override
  State<PasswordTextField> createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off_outlined,
          ),
        ),
        labelText: 'password',

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
