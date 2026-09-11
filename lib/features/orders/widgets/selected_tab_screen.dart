import 'package:flutter/cupertino.dart';
import 'package:login/features/products/entity/customer_order.dart';
import 'package:login/features/orders/widgets/comment.dart';
import 'package:login/features/orders/widgets/invoice.dart';
import 'package:login/features/orders/widgets/order_items.dart';

Widget selectedTabScreen(int index, CustomerOrder order, int customerId) {
  switch (index) {
    case 0:
      return OrderItems(customerOrder: order,);

    case 1:
      return Invoice(customerOrder: order,);

    case 2:
    return Comment(customerId: customerId,preComment: order.comment,);
  }

  return Invoice(customerOrder: order,);
}
