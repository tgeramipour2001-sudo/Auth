import 'package:dio/dio.dart';
import 'package:login/features/order/data/data_source/mock/save_order_entity.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';

final List<ServerOrderEntity> serverOrders = [];

Response<dynamic> saveOrdersToServer(Map<int, CartEntity> order) {
  final int orderId = serverOrders.length + 1;

  serverOrders.add(ServerOrderEntity(orderId: orderId, orders: order));

  return Response(
    requestOptions: RequestOptions(path: '/orders'),
    statusCode: 200,
    data: {
      'success': true,
      'message': 'Order saved successfully',
      'orderId': orderId,
    },
  );
}
