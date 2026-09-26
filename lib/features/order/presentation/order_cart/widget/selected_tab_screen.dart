import 'package:flutter/cupertino.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';
import 'package:login/features/order/presentation/order_cart/widget/comment.dart';
import 'package:login/features/order/presentation/order_cart/widget/invoice.dart';
import 'package:login/features/order/presentation/order_cart/widget/order_items.dart';

Widget selectedTabScreen(int index, CartEntity order, int customerId) {
  switch (index) {
    case 0:
      return OrderItems(customerOrder: order);

    case 1:
      return Invoice(customerOrder: order);

    case 2:
      return Comment(customerId: customerId, preComment: order.comment);
  }

  return Invoice(customerOrder: order);
}