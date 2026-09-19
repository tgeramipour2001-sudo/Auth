import 'package:dio/dio.dart';
import 'package:login/Core/error/validator_response.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';

import 'package:login/Features/Order/Data/Data_Source/Mock/save_order_to_server.dart';

class OrderCartRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  OrderCartRemoteDataSource({required this.httpClient});

  Future<int> saveOrder(Map<int, CartEntity> order) async {
    final response = saveOrdersToServer(order);

    validatedResponse(response);

    return response.data['orderId'] as int;
  }
}
