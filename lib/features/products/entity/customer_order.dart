import 'package:login/features/products/entity/product_ordered.dart';
import 'package:login/features/products/entity/total_price.dart';

class CustomerOrder {
  List<ProductOrdered> products;
  TotalPrice totalPrice;
   String comment;

  CustomerOrder(this.comment, {required this.products, required this.totalPrice});
}
