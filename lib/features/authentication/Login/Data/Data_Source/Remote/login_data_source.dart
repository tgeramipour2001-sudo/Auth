import 'package:dio/dio.dart';
import 'package:login/Core/error/validator_response.dart';
import 'package:login/Features/Authentication/Login/Data/Data_Source/Mock/fake_response_auth.dart';

import 'package:login/features/Authentication/Login/Domain/Entity/login_entity.dart';



class LoginRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  LoginRemoteDataSource({required this.httpClient});

  Future<LoginEntity> login(String username, String password) async {
    Response response;
    if (username == 'samian' && password == 'Samian123') {
     response = Response(
        requestOptions: RequestOptions(path: '/login'),
        statusCode: 200,

        data: {
          "token_type": "Bearer",
          "expires_in": 1296000,
          "access_token": '',
          "refresh_token": '',
        },
      );
    } else {
      response = fakeResponse(FakeResponseType.login);
    }

    validatedResponse(response);

    return LoginEntity(
      accessToken: response.data!["access_token"] as String,
      refreshToken: response.data!["refresh_token"] as String,
    );
  }
}
