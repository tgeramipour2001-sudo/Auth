import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white),
      child: Center(child: Text('Logged in successfully', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),)),
    );
  }

}