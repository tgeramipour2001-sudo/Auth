import 'package:login/domain/http_client.dart';
import 'package:login/features/orders/data/data_source/i_save_order_data_source.dart';
import 'package:login/features/orders/data/data_source/save_order_data_source.dart';
import 'package:login/features/orders/data/repository/i_save_order_repository.dart';
import 'package:login/features/products/entity/customer_order.dart';

final SaveOrderRepository saveOrderRepository = SaveOrderRepository(
  dataSource: SaveOrderRemoteDataSource(httpClient: httpClient),
);

class SaveOrderRepository implements ISaveOrderRepository {
  final ISaveOrderDataSource dataSource;

  SaveOrderRepository({required this.dataSource});
  @override
  Future<int> saveOrder(Map<int, CustomerOrder> order) {
    return dataSource.saveOrder(order);
  }
}
