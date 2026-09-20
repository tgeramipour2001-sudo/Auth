


import 'package:dio/dio.dart';
import 'package:login/core/error/validator_response.dart';
import 'package:login/features/order/data/data_source/mock/save_order_to_server.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';

class OrderCartRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  OrderCartRemoteDataSource({required this.httpClient});

  Future<int> saveOrder(Map<int, CartEntity> order) async {
    final response = saveOrdersToServer(order);

    validatedResponse(response);

    return response.data['orderId'] as int;
  }
}
