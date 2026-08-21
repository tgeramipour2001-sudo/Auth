import 'package:flutter/material.dart';
import 'package:login/features/customers/entity/customer.dart';

class CustomerAddressBox extends StatelessWidget {
  CustomerAddressBox({super.key, required this.customer, this.color});

  final CustomerEntity customer;
  Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    color = color == "" ?theme.textTheme.titleMedium!.color!:color;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 6),
      child: Expanded(
        child: Row(
          children: [
            Text(
              customer.address,
              style: theme.textTheme.titleMedium!.apply(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
