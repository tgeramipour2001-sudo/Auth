import 'package:dio/dio.dart';
import 'package:login/common/fake_response.dart';
import 'package:login/common/validator_response.dart';
import 'package:login/data/login.dart';

abstract class ILoginDataSource {
  Future<LoginInfo> login(String username, String password);
  Future<LoginInfo> register(String email, String password);
}

class LoginRemoteDataSource with HttpResponseValidator implements ILoginDataSource  {
  final Dio httpClient;

  LoginRemoteDataSource({required this.httpClient});

  @override
  Future<LoginInfo> login(String username, String password) async {
    //final response = await httpClient.post('',data{});
    Response  response;
    if(username =='samian' && password == 'Samian123'){
     response = fakeResponseLogin;}
    else{
      response = fakeResponseLoginFalse;
    }

    validatedResponse(response);
    
    return LoginInfo(
      accessToken: response.data!["access_token"] as String,
      refreshToken: response.data!["refresh_token"] as String,
    );
  }

  @override
  Future<LoginInfo> register(String email, String password) async {
    //final response = await httpClient.post('');

    final response = fakeResponseRegister;

    validatedResponse(response);

    return LoginInfo(accessToken: response.data!["token"] as String, refreshToken: "");

  }
}
