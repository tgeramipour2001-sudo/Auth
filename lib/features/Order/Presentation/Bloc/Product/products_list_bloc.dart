import 'package:bloc/bloc.dart';
import 'package:login/Core/Error/exception.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/total_price_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/cart_item_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Product_Entity/product_entity.dart';
import 'package:login/Features/Order/Domain/Repository/i_product_list_repository.dart';
import 'package:login/Features/Order/Presentation/Product/Logic/product_search.dart';
import 'package:login/Features/Order/Presentation/Product/Logic/total_price_calculate.dart';

import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';
import 'package:meta/meta.dart';

part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final IProductListRepository productListRepository;

  //آیتم های انتخابی هر مشتری در این مپ ذخیره می شود
  Map<int, CartEntity> customersOrder = {};
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
                  CartEntity(
                    products: [],
                    totalPrice: TotalPriceEntity(0, 0, 0),
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
                  CartEntity(
                    products: [],
                    totalPrice: TotalPriceEntity(0, 0, 0),
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
                CartItemEntity(event.product.product, event.product.count),
              );
            }
          } else {
            customersOrder.addEntries([
              MapEntry(
                event.customer.id,
                CartEntity(
                  products: [event.product],
                  totalPrice: TotalPriceEntity(0, 0, 0),
                  '',
                ),
              ),
            ]);
          }

          final products = await productListRepository.getAllProducts();
          customersOrder[event.customer.id]!.totalPrice = totalPriceCalculate(
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
      } else if (event is ProductListDelete) {
        final customerIndex = customersOrder[event.customerId];

        if (customerIndex != null) {
          customersOrder.remove(event.customerId);
        }
      }
    });
  }
}
