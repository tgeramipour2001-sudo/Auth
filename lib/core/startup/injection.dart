

import 'package:get_it/get_it.dart';
import 'package:login/features/order/data/repository/order_cart_repository.dart';
import 'package:login/features/order/data/repository/product_list_repository.dart';
import 'package:login/features/order/presentation/bloc/order_cart/save_order_bloc.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ProductsListBloc>(() {
    final bloc = ProductsListBloc(productListRepository: productListRepository);

    bloc.add(ProductListInitial());

    return bloc;
  });

  getIt.registerLazySingleton<SaveOrderBloc>(() {
    final bloc = SaveOrderBloc(saveOrderRepository: saveOrderRepository);

    return bloc;
  });
}
