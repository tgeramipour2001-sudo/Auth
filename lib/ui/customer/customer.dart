import 'package:flutter/material.dart';

class CustomeScreen extends StatelessWidget {
  const CustomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        
          decoration: BoxDecoration(
            color: Colors.amber
          ),
        ),
      ),
    );
  }
}
