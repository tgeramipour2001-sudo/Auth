
import 'package:flutter/material.dart';
import 'package:login/data/customer.dart';

class CustomerAddressBox extends StatelessWidget {
  const CustomerAddressBox({
    super.key,
    required this.customer,
    required this.theme,
  });

  final CustomerEntity customer;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 6,
      ),
      child: Expanded(
        child: Row(
          children: [
            Text(
              customer.address,
              style:
                  theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}