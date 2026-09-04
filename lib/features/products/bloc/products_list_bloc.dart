import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/products/data/repository/i_product_list_repository.dart';
import 'package:login/features/products/entity/product.dart';
import 'package:login/features/products/entity/product_ordered.dart';
import 'package:login/features/products/entity/total_price.dart';
import 'package:login/features/products/functions/product_search.dart';
import 'package:login/features/products/functions/total_price_calculate.dart';
import 'package:meta/meta.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final IProductListRepository productListRepository;
  TotalPrice totalPrice;
  List<ProductOrdered> productList = [];

  ProductsListBloc({
    required this.productListRepository,
    required this.totalPrice ,
  }) : super(ProductListLoading()) {
    on<ProductsListEvent>((event, emit) async {
      if (event is ProductListStarted) {
        emit(ProductListLoading());
        try {
          final products = await productListRepository.getAllProducts();
          emit(ProductListSuccess(products: products, totalPrice: totalPrice));
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      } else if (event is ProductListFilter) {
        try {
          List<ProductEntity> products;
          products = FilterProducts(
            event.searchedTextField,
            await productListRepository.getAllProducts(),
          );
          emit(ProductListSuccess(products: products, totalPrice: totalPrice));
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      } else if (event is ProductClicked) {
        try {
          final index = productList.indexWhere(
            (item) => item.product.id == event.product.product.id,
          );

          if (index != -1) {
            productList[index].count = event.product.count;
          } else {
            productList.add(event.product);
          }

          TotalPriceCalculate(productList, totalPrice);

          final products = await productListRepository.getAllProducts();
          emit(ProductListSuccess(products: products, totalPrice: totalPrice));
          // emit(ProductListSuccess());
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      }
    });
  }
}
