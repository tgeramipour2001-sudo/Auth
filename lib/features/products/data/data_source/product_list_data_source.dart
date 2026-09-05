import 'package:dio/dio.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/domain/fake_response_product.dart';
import 'package:login/features/products/data/data_source/i_product_list_data_source.dart';
import 'package:login/features/products/entity/product.dart';

class ProductListRemoteDataSource
    with HttpResponseValidator
    implements IProductListDataSource {
  final Dio dataSource;

  ProductListRemoteDataSource({required this.dataSource});

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final response = ProductFakeResponse();
    validatedResponse(response);

    List<ProductEntity> products = [];
    for (var value in (response.data as List)) {
      products.add(ProductEntity.fromJson(value));
    }
    return products;
  }

  @override
  Future<List<ProductEntity>> searchProducts(String searchName) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
