import 'package:flutter/material.dart';

class CustomerImage extends StatelessWidget {
  final String imageFileName;
  const CustomerImage({super.key, required this.imageFileName});

  @override
  Widget build(BuildContext context) {
    
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(70),
      child: imageFileName == ""
                    ? Image.asset('assets/img/default_customer.png', width: 100,height: 100,)
                    : Image.network(imageFileName),
    );
  }

}