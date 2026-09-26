
import 'package:login/features/order/domain/entity/product_entity/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;

  CartItemEntity(this.product, this.count);
}
