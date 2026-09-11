import 'package:dio/dio.dart';
import 'package:login/domain/save_orders/save_order_entity.dart' show ServerOrder, ServerOrderEntity;
import 'package:login/features/products/entity/customer_order.dart';

final List<ServerOrderEntity> serverOrders =[];


Response<dynamic>   saveOrdersToServer(Map<int, CustomerOrder> order) {
  final int orderId = serverOrders.length + 1;

  serverOrders.add(
    ServerOrderEntity(
      orderId: orderId,
      orders: order,
    ),
  );

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