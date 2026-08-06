

import 'package:flutter/material.dart';
import 'package:login/data/customer.dart';

class CustomerNameBox extends StatelessWidget {
  const CustomerNameBox({
    super.key,
    required this.customer,
    required this.theme,
    required this.containerColor,
  });

  final CustomerEntity customer;
  final ThemeData theme;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            customer.name,
            style: theme
                .textTheme
                .headlineMedium!
                .apply(color: containerColor),
          ),
        ],
      ),
    );
  }
}
