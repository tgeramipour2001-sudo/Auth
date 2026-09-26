


import 'package:login/core/http_client/http_client.dart';
import 'package:login/features/authentication/login/data/data_source/remote/login_data_source.dart';
import 'package:login/features/authentication/login/data/repository/login_repository.dart';

final LoginRepository loginRepository = LoginRepository(
  dataSource: LoginRemoteDataSource(httpClient: httpClient),
);

abstract class ILoginRepository {
  Future<void> login(String username, String password);
  Future<void> signOut();
}