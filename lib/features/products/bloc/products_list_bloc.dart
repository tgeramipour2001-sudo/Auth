import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/customers/entity/customer.dart';
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

  //آیتم های انتخابی هر مشتری در این مپ ذخیره می شود
  Map<int, List<ProductOrdered>> customersOrder = {};
  ProductsListBloc({required this.productListRepository})
    : super(ProductListLoading()) {
    on<ProductsListEvent>((event, emit) async {
      if (event is ProductListStarted) {
        emit(ProductListLoading());
        try {
          final products = await productListRepository.getAllProducts();
          emit(
            ProductListSuccess(
              products: products,
              totalPrice: TotalPrice(0, 0, 0, -1),
            ),
          );
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
          emit(
            ProductListSuccess(
              products: products,
              totalPrice: TotalPriceCalculate(
                customersOrder[event.customer.id] ?? [],
                event.customer.id,
              ),
            ),
          );
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      } else if (event is ProductClicked) {
        try {
          //پیدا کردن شناسه مشتری در لیست
          final customerIndex = customersOrder[event.customer.id];

          if (customerIndex != null) {
            final productIndex = customerIndex.indexWhere((value) {
              return value.product.id == event.product.product.id;
            });

            if (productIndex != -1) {
              customerIndex[productIndex].count = event.product.count;
            } else {
              customerIndex.add(event.product);
              // customersOrder[event.customer.id] = customerIndex;
            }
          } else {
            customersOrder.addEntries([
              MapEntry(event.customer.id, [event.product]),
            ]);
          }
          ;

          final products = await productListRepository.getAllProducts();
          emit(
            ProductListSuccess(
              products: products,
              totalPrice: TotalPriceCalculate(
                customersOrder[event.customer.id] ?? [],
                event.customer.id,
              ),
            ),
          );
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      }
    });
  }
}
