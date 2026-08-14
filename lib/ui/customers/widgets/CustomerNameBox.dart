import 'package:flutter/material.dart';
import 'package:login/data/customer.dart';

class CustomerNameBox extends StatelessWidget {
  final CustomerEntity customer;
  final Color containerColor;
  const CustomerNameBox({
    super.key,
    required this.customer,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            customer.name,
            style: theme.textTheme.headlineMedium!.apply(color: containerColor),
          ),
        ],
      ),
    );
  }
}
