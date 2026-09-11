import 'package:login/features/products/entity/product.dart';

List<ProductEntity> FilterProducts(
  String searchedField,
  List<ProductEntity> products,
) {
  final List<ProductEntity> productFilter = [];

  for (final product in products) {
    if (product.name.toLowerCase().contains(searchedField.toLowerCase())) {
      productFilter.add(product);
    }
  }
  return productFilter;
}
