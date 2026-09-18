

import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';

class ServerOrderEntity {
  final int orderId;
  final Map<int, CartEntity> orders;

  ServerOrderEntity({
    required this.orderId,
    required this.orders,
  });
}