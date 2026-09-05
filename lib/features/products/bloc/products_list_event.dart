part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListEvent {}


class ProductListStarted extends ProductsListEvent{


  ProductListStarted();
}

class ProductListFilter extends ProductsListEvent{
  final String searchedTextField;
final CustomerEntity customer;
  ProductListFilter({required this.searchedTextField, required this.customer});
}

class ProductClicked extends ProductsListEvent{
  final ProductOrdered product;
  final CustomerEntity customer;

  ProductClicked({required this.product, required this.customer});
}
