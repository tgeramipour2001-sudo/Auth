import 'package:login/features/products/entity/customer_order.dart';
import 'package:login/features/products/entity/product.dart';

abstract class IProductListDataSource {
  Future<List<ProductEntity>> getAllProducts();
  Future<List<ProductEntity>> searchProducts(String searchName);

 
}