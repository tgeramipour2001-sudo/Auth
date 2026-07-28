import 'package:flutter/material.dart';
import 'package:login/common/http_client.dart';
import 'package:login/data/login.dart';
import 'package:login/data/source/login_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';


final LoginRepository loginRepository = LoginRepository(dataSource: LoginRemoteDataSource(httpClient: httpClient));

abstract class ILoginRepository {
  Future<void> login(String username, String password);
  Future<void> register(String email, String password);
}

class LoginRepository implements ILoginRepository {
  static final ValueNotifier<LoginInfo?> loginChangeNotifier = ValueNotifier(
    null,
  );
  final ILoginDataSource dataSource;

  LoginRepository({required this.dataSource});

  @override
  Future<void> login(String username, String password) async {
    final LoginInfo loginInfo = await dataSource.login(username, password);
    _persistLoginTokens(loginInfo);
  }

  @override
  Future<void> register(String email, String password) async {
    final LoginInfo loginInfo =  await dataSource.register(email, password);
    _persistLoginTokens(loginInfo);
  }

  //save token
  Future<void> _persistLoginTokens(LoginInfo loginInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("access_token", loginInfo.accessToken);
    sharedPreferences.setString("refresh_token", loginInfo.refreshToken);
    loadAuthInfo();
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';
    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';

    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      loginChangeNotifier.value = LoginInfo(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
  }
}
