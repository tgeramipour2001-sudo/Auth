
import 'package:dio/dio.dart';
import 'package:login/Core/error/validator_response.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/product_entity.dart';

import 'package:login/Features/Order/Data/Data_Source/Mock/fake_response_product.dart';

class ProductListRemoteDataSource with HttpResponseValidator {
  final Dio dataSource;

  ProductListRemoteDataSource({required this.dataSource});

  Future<List<ProductEntity>> getAllProducts() async {
    final response = ProductFakeResponse();
    validatedResponse(response);

    List<ProductEntity> products = [];
    for (var value in (response.data as List)) {
      products.add(ProductEntity.fromJson(value));
    }
    return products;
  }

  Future<List<ProductEntity>> searchProducts(String searchName) {
    // TODO: implement searchProducts
    throw UnimplementedError();
  }
}
