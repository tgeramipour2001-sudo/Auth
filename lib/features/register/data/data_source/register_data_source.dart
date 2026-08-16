import 'package:dio/dio.dart';
import 'package:login/domain/fake_response_auth.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/features/register/entity/register.dart';
import 'package:login/features/register/data/data_source/i_register_dat_source.dart';

class RegisterRemoteDataSource
    with HttpResponseValidator
    implements IRegisterDatSource {
  final Dio httpClient;

  RegisterRemoteDataSource({required this.httpClient});

  @override
  Future<RegisterInfo> register(String email, String password) async {
    //final response = await httpClient.post('');

    final response = fakeResponse(FakeResponseType.register);

    validatedResponse(response);

    return RegisterInfo(accessToken: response.data!["access_token"] as String);
  }
}
