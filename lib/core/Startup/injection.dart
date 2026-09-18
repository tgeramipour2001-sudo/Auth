import 'package:get_it/get_it.dart';
import 'package:login/Features/Order/Data/Repository/order_cart_repository.dart';
import 'package:login/Features/Order/Data/Repository/product_list_repository.dart';
import 'package:login/Features/Order/Presentation/Bloc/Order_Cart/save_order_bloc.dart';
import 'package:login/Features/Order/Presentation/Bloc/Product/products_list_bloc.dart';

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
