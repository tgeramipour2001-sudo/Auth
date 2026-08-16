import 'package:dio/dio.dart';
import 'package:login/domain/fake_response_auth.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/features/login/entity/login.dart';
import 'package:login/features/login/data/data_source/i_login_data_source.dart';

class LoginRemoteDataSource
    with HttpResponseValidator
    implements ILoginDataSource {
  final Dio httpClient;

  LoginRemoteDataSource({required this.httpClient});

  @override
  Future<LoginInfo> login(String username, String password) async {
    //final response = await httpClient.post('',data{});
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

    return LoginInfo(
      accessToken: response.data!["access_token"] as String,
      refreshToken: response.data!["refresh_token"] as String,
    );
  }
}
