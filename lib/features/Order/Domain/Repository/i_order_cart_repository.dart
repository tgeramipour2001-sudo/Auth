import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';

abstract class IOrderCartRepository {
   Future<int> saveOrder(Map<int, CartEntity> order);
}