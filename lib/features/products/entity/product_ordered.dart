import 'package:login/features/products/entity/product.dart';

class ProductOrdered {
  final ProductEntity product;
  int count;

  ProductOrdered(this.product, this.count);
}