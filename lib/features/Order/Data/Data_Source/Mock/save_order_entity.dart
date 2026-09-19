

import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';

class ServerOrderEntity {
  final int orderId;
  final Map<int, CartEntity> orders;

  ServerOrderEntity({
    required this.orderId,
    required this.orders,
  });
}