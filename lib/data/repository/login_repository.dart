import 'package:flutter/material.dart';
import 'package:login/data/login.dart';
import 'package:login/data/repository/i_login_repository.dart';
import 'package:login/data/save_token.dart';
import 'package:login/data/source/i_login_data_source.dart'
    show ILoginDataSource;
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<void> signOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.clear();
    loginChangeNotifier.value = null;
  }
}
