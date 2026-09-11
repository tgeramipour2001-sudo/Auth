import 'package:login/features/products/entity/customer_order.dart';

abstract class ISaveOrderDataSource {
   Future<int> saveOrder(Map<int, CustomerOrder> order);
}