import 'package:login/features/products/entity/product.dart';

abstract class IProductListRepository {
   Future<List<ProductEntity>> getAllProducts();
  Future<List<ProductEntity>> searchProducts(String searchName);
}