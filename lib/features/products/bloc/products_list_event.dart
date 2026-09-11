part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListEvent {}

class ProductListInitial extends ProductsListEvent {}

class ProductListStarted extends ProductsListEvent {
  final int customerId;
  ProductListStarted({required this.customerId});
}

class ProductListFilter extends ProductsListEvent {
  final String searchedTextField;
  final CustomerEntity customer;
  ProductListFilter({required this.searchedTextField, required this.customer});
}

class ProductClicked extends ProductsListEvent {
  final ProductOrdered product;
  final CustomerEntity customer;

  ProductClicked({required this.product, required this.customer});
}

class ProductListDelete extends ProductsListEvent{
  final int customerId;

  ProductListDelete({required this.customerId});

}