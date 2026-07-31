import 'package:login/common/http_client.dart';
import 'package:login/data/repository/login_repository.dart';
import 'package:login/data/source/login_data_source.dart';

final LoginRepository loginRepository = LoginRepository(dataSource: LoginRemoteDataSource(httpClient: httpClient));

abstract class ILoginRepository {
  Future<void> login(String username, String password);
  Future<void> register(String email, String password);
}