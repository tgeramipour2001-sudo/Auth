

import 'package:login/features/order/domain/entity/order_cart_entity/total_price_entity.dart';
import 'package:login/features/order/domain/entity/product_entity/cart_item_entity.dart';

class CartEntity {
  List<CartItemEntity> products;
  TotalPriceEntity totalPrice;
   String comment;

  CartEntity(this.comment, {required this.products, required this.totalPrice});
}
