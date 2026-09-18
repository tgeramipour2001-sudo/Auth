

import 'package:login/Core/Http_Client/http_client.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Data/Data_Source/Remote/order_cart_data_source.dart';
import 'package:login/Features/Order/Domain/Repository/i_order_cart_repository.dart';


final OrderCartRepository saveOrderRepository = OrderCartRepository(
  dataSource: OrderCartRemoteDataSource(httpClient: httpClient),
);

class OrderCartRepository implements IOrderCartRepository {
  final OrderCartRemoteDataSource dataSource;

  OrderCartRepository({required this.dataSource});

  @override
  Future<int> saveOrder(Map<int, CartEntity> order) async => dataSource.saveOrder(order);

}
