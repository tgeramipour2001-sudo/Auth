import 'package:login/Features/Order/Domain/Entity/Product_Entity/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;

  CartItemEntity(this.product, this.count);
}
