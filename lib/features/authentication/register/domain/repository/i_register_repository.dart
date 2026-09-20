
import 'package:login/Core/Http_Client/http_client.dart';
import 'package:login/features/Authentication/Register/Data/Data_Source/Remote/register_data_source.dart';
import 'package:login/features/Authentication/register/data/repository/register_repository.dart';

final RegisterRepository registerRepository = RegisterRepository(
  dataSource: RegisterRemoteDataSource(httpClient: httpClient),
);

abstract class IRegisterRepository {
  Future<void> register(String email, String password);
}
