part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListEvent {}


class ProductListStarted extends ProductsListEvent{}

class ProductListFilter extends ProductsListEvent{
  final String searchedTextField;

  ProductListFilter({required this.searchedTextField});
}

class ProductClicked extends ProductsListEvent{
  final ProductOrdered product;

  ProductClicked({required this.product});
}
