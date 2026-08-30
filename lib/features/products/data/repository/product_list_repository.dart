import 'package:login/domain/http_client.dart';
import 'package:login/features/products/data/data_source/product_list_data_source.dart';
import 'package:login/features/products/data/repository/i_product_list_repository.dart';
import 'package:login/features/products/entity/product.dart';

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
