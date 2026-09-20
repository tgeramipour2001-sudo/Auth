

import 'package:login/core/http_client/http_client.dart';
import 'package:login/features/order/data/data_source/remote/product_list_data_source.dart';
import 'package:login/features/order/domain/entity/product_entity/product_entity.dart';
import 'package:login/features/order/domain/repository/i_product_list_repository.dart';

final ProductListRepository productListRepository = ProductListRepository(
  dataSource: ProductListRemoteDataSource(dataSource: httpClient),
);

class ProductListRepository implements IProductListRepository {
  final ProductListRemoteDataSource dataSource;

  ProductListRepository({required this.dataSource});

  @override
  Future<List<ProductEntity>> getAllProducts() => dataSource.getAllProducts();

  @override
  Future<List<ProductEntity>> searchProducts(String searchName) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }

 
}
