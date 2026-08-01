import 'package:flutter/material.dart';
import 'package:login/data/login.dart';
import 'package:login/data/register.dart';
import 'package:login/data/repository/i_register_repository.dart';
import 'package:login/data/save_token.dart';
import 'package:login/data/source/i_register_dat_source.dart';

class RegisterRepository with SaveToken implements IRegisterRepository {
  static final ValueNotifier<LoginInfo?> loginChangeNotifier = ValueNotifier(
    null,
  );
  final IRegisterDatSource dataSource;

  RegisterRepository({required this.dataSource});


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
