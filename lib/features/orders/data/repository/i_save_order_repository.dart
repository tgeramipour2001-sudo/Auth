import 'package:login/features/products/entity/customer_order.dart';

abstract class ISaveOrderRepository {
   Future<int> saveOrder(Map<int, CustomerOrder> order);
}