import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:login/core/authentication/hive_entity/save_info.dart';
import 'package:login/core/http_client/http_client.dart';
import 'package:login/features/authentication/Register/Presentation/bloc/register_bloc.dart';
import 'package:login/features/authentication/register/data/data_source/db/register_local_data_source.dart';
import 'package:login/features/authentication/register/data/data_source/remote/register_data_source.dart';
import 'package:login/features/authentication/register/data/repository/register_repository.dart';
import 'package:login/features/order/data/repository/order_cart_repository.dart';
import 'package:login/features/order/data/repository/product_list_repository.dart';
import 'package:login/features/order/presentation/bloc/order_cart/save_order_bloc.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:login/main.dart';

final getIt = GetIt.instance;

void setupDependencies() {

  //blocs
  getIt.registerLazySingleton<ProductsListBloc>(() {
    final bloc = ProductsListBloc(productListRepository: productListRepository);

    bloc.add(ProductListInitial());

    return bloc;
  });

  getIt.registerLazySingleton<SaveOrderBloc>(() {
    final bloc = SaveOrderBloc(saveOrderRepository: saveOrderRepository);

    return bloc;
  });

  getIt.registerLazySingleton<RegisterBloc>((){
    final bloc = RegisterBloc(repository: getIt<RegisterRepository>());
    return bloc;
  });

  //repositories
  getIt.registerLazySingleton<RegisterLocalDataSource>(() {
    return RegisterLocalDataSource(
      saveInfoBox: Hive.box<SaveInfo>(saveInfoBoxName),
    );
  });

  getIt.registerLazySingleton<RegisterRepository>(() {
    return RegisterRepository(
      dataSource: RegisterRemoteDataSource(httpClient: httpClient),
      localDataSource: getIt<RegisterLocalDataSource>(),
    );
  });
}
