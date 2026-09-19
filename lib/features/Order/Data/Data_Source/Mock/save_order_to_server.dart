import 'package:dio/dio.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Data/Data_Source/Mock/save_order_entity.dart';

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
