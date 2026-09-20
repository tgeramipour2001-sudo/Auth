

import 'package:login/features/order/domain/entity/product_entity/product_entity.dart';

abstract class IProductListRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<List<ProductEntity>> searchProducts(String searchName);
 
}
