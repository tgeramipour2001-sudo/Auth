import 'package:login/Core/Http_Client/http_client.dart';
import 'package:login/Features/Order/Data/Data_Source/Remote/product_list_data_source.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/product_entity.dart';
import 'package:login/Features/Order/Domain/Repository/i_product_list_repository.dart';


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
