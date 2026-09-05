import 'package:flutter/cupertino.dart';
import 'package:login/features/products/widgets/invoice.dart';
import 'package:login/features/products/widgets/order_items.dart';

Widget selectedTabScreen(int index) {
  switch (index) {
    case 0:
      return OrderItems();

    case 1:
      return Invoice();

    case 2:
  }

  return OrderItems();
}
