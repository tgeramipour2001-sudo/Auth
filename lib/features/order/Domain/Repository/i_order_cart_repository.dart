
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';

abstract class IOrderCartRepository {
   Future<int> saveOrder(Map<int, CartEntity> order);
}