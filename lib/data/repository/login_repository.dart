import 'package:flutter/material.dart';
import 'package:login/data/login.dart';
import 'package:login/data/register.dart';
import 'package:login/data/repository/i_login_repository.dart';
import 'package:login/data/save_token.dart';
import 'package:login/data/source/i_login_data_source.dart' show ILoginDataSource;

class LoginRepository with SaveToken implements ILoginRepository {
  static final ValueNotifier<LoginInfo?> loginChangeNotifier = ValueNotifier(
    null,
  );
  final ILoginDataSource dataSource;

  LoginRepository({required this.dataSource});

  @override
  Future<void> login(String username, String password) async {
    final LoginInfo loginInfo = await dataSource.login(username, password);
    persistLoginTokens(loginInfo);
    loadAuthInfo(loginChangeNotifier);
  }

  @override
  Future<void> register(String email, String password) async {
    final RegisterInfo registerInfo = await dataSource.register(
      email,
      password,
    );
    final LoginInfo loginInfo = LoginInfo(
      accessToken: registerInfo.accessToken,
      refreshToken: "",
    );
    persistLoginTokens(loginInfo);
    loadAuthInfo(loginChangeNotifier);
  }

 
}
