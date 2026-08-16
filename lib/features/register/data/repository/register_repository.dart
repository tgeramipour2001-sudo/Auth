import 'package:flutter/material.dart';
import 'package:login/features/login/entity/login.dart';
import 'package:login/features/register/entity/register.dart';
import 'package:login/features/register/data/repository/i_register_repository.dart';
import 'package:login/features/login/functions/save_token.dart';
import 'package:login/features/register/data/data_source/i_register_dat_source.dart';

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
