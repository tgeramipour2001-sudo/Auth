import 'package:login/domain/http_client.dart';
import 'package:login/features/register/data/repository/register_repository.dart';
import 'package:login/features/register/data/data_source/register_data_source.dart';

final RegisterRepository registerRepository = RegisterRepository(dataSource: RegisterRemoteDataSource(httpClient: httpClient));

abstract class IRegisterRepository {
  Future<void> register(String email, String password);
}