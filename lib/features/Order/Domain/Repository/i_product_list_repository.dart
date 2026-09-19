
import 'package:login/Features/Order/Domain/Entity/Product_Entity/product_entity.dart';

abstract class IProductListRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<List<ProductEntity>> searchProducts(String searchName);
 
}
