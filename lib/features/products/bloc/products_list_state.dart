part of 'products_list_bloc.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}

class ProductListLoading extends ProductsListState{}

class ProductListError extends ProductsListState{
  final AppExeception exeception;

  ProductListError(this.exeception);
}

class ProductListSuccess extends ProductsListState{
  final List<ProductEntity> products;

  ProductListSuccess({required this.products});
}
