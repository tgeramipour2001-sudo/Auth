import 'package:get_it/get_it.dart';
import 'package:login/features/orders/bloc/save_order_bloc.dart';
import 'package:login/features/orders/data/repository/save_order_repository.dart';

import 'package:login/features/products/bloc/products_list_bloc.dart';
import 'package:login/features/products/data/repository/product_list_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<ProductsListBloc>(() {
    final bloc = ProductsListBloc(
      productListRepository: productListRepository,
    );

    bloc.add(ProductListInitial());

    return bloc;
  });

  getIt.registerLazySingleton<SaveOrderBloc>(() {
    final bloc = SaveOrderBloc(
      saveOrderRepository: saveOrderRepository,
     
    );

  
    return bloc;
  });
}