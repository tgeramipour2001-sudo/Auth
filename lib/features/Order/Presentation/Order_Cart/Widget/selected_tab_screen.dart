import 'package:flutter/cupertino.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Presentation/Order_Cart/Widget/comment.dart';
import 'package:login/Features/Order/Presentation/Order_Cart/Widget/invoice.dart';
import 'package:login/Features/Order/Presentation/Order_Cart/Widget/order_items.dart';

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
