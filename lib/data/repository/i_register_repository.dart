import 'package:login/common/http_client.dart';
import 'package:login/data/repository/register_repository.dart';
import 'package:login/data/source/register_data_source.dart';

final RegisterRepository registerRepository = RegisterRepository(dataSource: RegisterRemoteDataSource(httpClient: httpClient));

abstract class IRegisterRepository {
  Future<void> register(String email, String password);
}