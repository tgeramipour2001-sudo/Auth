
import 'package:dio/dio.dart';
import 'package:login/core/error/validator_response.dart';
import 'package:login/features/order/data/data_source/mock/fake_response_product.dart';

import 'package:login/features/order/domain/entity/product_entity/product_entity.dart';


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