import 'package:dio/dio.dart';
import 'package:login/common/fake_response.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/data/register.dart';
import 'package:login/data/source/i_register_dat_source.dart';

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
