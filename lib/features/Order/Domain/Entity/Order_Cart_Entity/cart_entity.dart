import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/total_price_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/cart_item_entity.dart';

class CartEntity {
  List<CartItemEntity> products;
  TotalPriceEntity totalPrice;
   String comment;

  CartEntity(this.comment, {required this.products, required this.totalPrice});
}
