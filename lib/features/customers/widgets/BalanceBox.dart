import 'package:flutter/material.dart';
import 'package:login/features/customers/entity/customer.dart';

class BalanceBox extends StatelessWidget {
  final String title;
  final String detail;
  final CustomerEntity customer;
  Color? color ;
  BalanceBox({
    super.key,
    required this.customer,
    required this.title,
    required this.detail,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    color = color == ""?theme.textTheme.titleSmall!.color!:color;
    return Column(
      children: [
        Text(title, style: theme.textTheme.titleSmall!.apply(color:color )),
        Text(detail, style: theme.textTheme.titleSmall!.apply(color: color)),
      ],
    );
  }
}
