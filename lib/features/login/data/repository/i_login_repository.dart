import 'package:login/domain/http_client.dart';
import 'package:login/features/login/data/repository/login_repository.dart';
import 'package:login/features/login/data/data_source/login_data_source.dart';

final LoginRepository loginRepository = LoginRepository(
  dataSource: LoginRemoteDataSource(httpClient: httpClient),
);

abstract class ILoginRepository {
  Future<void> login(String username, String password);
   Future<void> signOut();
}
