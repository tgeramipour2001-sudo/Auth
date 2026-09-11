import 'package:bloc/bloc.dart';
import 'package:login/common/exception.dart';
import 'package:login/features/customers/entity/customer.dart';
import 'package:login/features/products/data/repository/i_product_list_repository.dart';
import 'package:login/features/products/entity/customer_order.dart';
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
  Map<int, CustomerOrder> customersOrder = {};
  ProductsListBloc({required this.productListRepository})
    : super(ProductListLoading()) {
    on<ProductsListEvent>((event, emit) async {
      if (event is ProductListStarted || event is ProductListInitial) {
        emit(ProductListLoading());
        try {
          final products = await productListRepository.getAllProducts();
          emit(
            ProductListSuccess(
              products: products,
              customerOrder:
                  customersOrder[0] ??
                  CustomerOrder(
                    products: [],
                    totalPrice: TotalPrice(0, 0, 0),
                    '',
                  ),
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
              customerOrder:
                  customersOrder[event.customer.id] ??
                  CustomerOrder(
                    products: [],
                    totalPrice: TotalPrice(0, 0, 0),
                    '',
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

          //پیدا کردن محصول
          if (customerIndex != null) {
            final productIndex = customerIndex.products.indexWhere((value) {
              return value.product.id == event.product.product.id;
            });

            if (productIndex != -1) {
              customersOrder[event.customer.id]!.products[productIndex].count =
                  event.product.count;
            } else {
              customersOrder[event.customer.id]!.products.add(
                ProductOrdered(event.product.product, event.product.count),
              );
            }
          } else {
            customersOrder.addEntries([
              MapEntry(
                event.customer.id,
                CustomerOrder(
                  products: [event.product],
                  totalPrice: TotalPrice(0, 0, 0),
                  '',
                ),
              ),
            ]);
          }

          final products = await productListRepository.getAllProducts();
          customersOrder[event.customer.id]!.totalPrice = TotalPriceCalculate(
            customersOrder[event.customer.id]!.products ?? [],
            event.customer.id,
          );
          emit(
            ProductListSuccess(
              products: products,
              customerOrder: customersOrder[event.customer.id]!,
            ),
          );
        } catch (e) {
          emit(ProductListError(AppExeception(message: e.toString())));
        }
      } 

      else if(event is ProductListDelete){
        final customerIndex = customersOrder[event.customerId];

        if(customerIndex != null){
          customersOrder.remove(event.customerId);
        }
      }
    });
  }
}
