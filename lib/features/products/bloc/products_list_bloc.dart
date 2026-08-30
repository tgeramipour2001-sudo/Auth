import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/products/data/repository/i_product_list_repository.dart';
import 'package:login/features/products/entity/product.dart';
import 'package:login/features/products/functions/product_search.dart';
import 'package:meta/meta.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final IProductListRepository productListRepository; 
  ProductsListBloc({required this.productListRepository}) : super(ProductListLoading()) {
    on<ProductsListEvent>((event, emit) async{
      if(event is ProductListStarted ){
      emit(ProductListLoading());
      try {
        final products = await productListRepository.getAllProducts();
        emit(ProductListSuccess(products: products));
      } catch (e) {
        emit(ProductListError(AppExeception(message: e.toString())));
      }
      }else if(event is ProductListFilter){
        try{
        List<ProductEntity> products;
         products = FilterProducts(event.searchedTextField, await productListRepository.getAllProducts()) ;
        emit(ProductListSuccess(products: products));
        }catch(e){
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      }
    });
  }
}
