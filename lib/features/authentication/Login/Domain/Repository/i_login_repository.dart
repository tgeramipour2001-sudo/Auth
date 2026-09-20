
import 'package:login/Core/Http_Client/http_client.dart';
import 'package:login/features/Authentication/Login/Data/Data_Source/Remote/login_data_source.dart';
import 'package:login/features/Authentication/Login/data/repository/login_repository.dart';

final LoginRepository loginRepository = LoginRepository(
  dataSource: LoginRemoteDataSource(httpClient: httpClient),
);

abstract class ILoginRepository {
  Future<void> login(String username, String password);
  Future<void> signOut();
}
