import 'package:login/features/products/entity/customer_order.dart';

class ServerOrderEntity {
  final int orderId;
  final Map<int, CustomerOrder> orders;

  ServerOrderEntity({
    required this.orderId,
    required this.orders,
  });
}