import 'package:flutter/material.dart';
import 'package:login/data/customer.dart';

class BalanceBox extends StatelessWidget {
  final String title;
  final String detail;
  const BalanceBox({
    super.key,
    required this.theme,
    required this.customer,
    required this.title,
    required this.detail,
  });

  final ThemeData theme;
  final CustomerEntity customer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: theme.textTheme.titleSmall),
        Text(detail, style: theme.textTheme.titleSmall),
      ],
    );
  }
}
