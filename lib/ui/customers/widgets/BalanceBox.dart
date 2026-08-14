import 'package:flutter/material.dart';
import 'package:login/data/customer.dart';

class BalanceBox extends StatelessWidget {
  final String title;
  final String detail;
  final CustomerEntity customer;
  const BalanceBox({
    super.key,
    required this.customer,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Text(title, style: theme.textTheme.titleSmall),
        Text(detail, style: theme.textTheme.titleSmall),
      ],
    );
  }
}
