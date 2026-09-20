import 'package:dio/dio.dart';
import 'package:login/Core/error/validator_response.dart';
import 'package:login/Features/Authentication/Login/Data/Data_Source/Mock/fake_response_auth.dart';

import 'package:login/features/Authentication/Register/Domain/Entity/register_entity.dart';

class RegisterRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  RegisterRemoteDataSource({required this.httpClient});

  Future<RegisterEntity> register(String email, String password) async {
    //final response = await httpClient.post('');

    final response = fakeResponse(FakeResponseType.register);

    validatedResponse(response);

    return RegisterEntity(
      accessToken: response.data!["access_token"] as String,
    );
  }
}
