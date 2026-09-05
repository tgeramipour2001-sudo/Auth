part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}

class ProductListLoading extends ProductsListState {}

class ProductListError extends ProductsListState {
  final AppExeception exeception;

  ProductListError(this.exeception);
}

class ProductListSuccess extends ProductsListState {
  final List<ProductEntity> products;
  final TotalPrice totalPrice;

  ProductListSuccess({required this.products, required this.totalPrice});
}
