import 'package:flutter/material.dart';
import 'package:login/features/customers/entity/customer.dart';

class CustomerNameBox extends StatelessWidget {
  final CustomerEntity customer;
  Color? containerColor ;
   CustomerNameBox({
    super.key,
    required this.customer,
    this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    containerColor = containerColor == ''? Color(0xff204680):containerColor;
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
