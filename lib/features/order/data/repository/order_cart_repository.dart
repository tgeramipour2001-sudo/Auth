

import 'package:login/core/http_client/http_client.dart';
import 'package:login/features/order/data/data_source/remote/order_cart_data_source.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';
import 'package:login/features/order/domain/repository/i_order_cart_repository.dart';

final OrderCartRepository saveOrderRepository = OrderCartRepository(
  dataSource: OrderCartRemoteDataSource(httpClient: httpClient),
);

class OrderCartRepository implements IOrderCartRepository {
  final OrderCartRemoteDataSource dataSource;

  OrderCartRepository({required this.dataSource});

  @override
  Future<int> saveOrder(Map<int, CartEntity> order) async => dataSource.saveOrder(order);

}
