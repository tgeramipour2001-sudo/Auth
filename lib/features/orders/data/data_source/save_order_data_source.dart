import 'package:dio/dio.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/domain/save_orders/save_order_to_server.dart';
import 'package:login/features/orders/data/data_source/i_save_order_data_source.dart';
import 'package:login/features/products/entity/customer_order.dart';

class SaveOrderRemoteDataSource
    with HttpResponseValidator
    implements ISaveOrderDataSource {
  final Dio httpClient;

  SaveOrderRemoteDataSource({required this.httpClient});
  @override
  Future<int> saveOrder(Map<int, CustomerOrder> order) async {
    final response = await saveOrdersToServer(order);

    validatedResponse(response);

    return response.data['orderId'] as int;
  }
}
