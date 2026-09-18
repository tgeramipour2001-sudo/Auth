import 'package:flutter/material.dart';
import 'package:login/core/Authentication/Function/save_token.dart';
import 'package:login/features/Authentication/Login/Domain/Entity/login_entity.dart';
import 'package:login/features/Authentication/Register/Data/Data_Source/Remote/register_data_source.dart';
import 'package:login/features/Authentication/Register/Domain/Entity/register_entity.dart';

import 'package:login/features/Authentication/Register/Domain/Repository/i_register_repository.dart';

class RegisterRepository with SaveToken implements IRegisterRepository {
  static final ValueNotifier<LoginEntity?> loginChangeNotifier = ValueNotifier(
    null,
  );
  final RegisterRemoteDataSource dataSource;

  RegisterRepository({required this.dataSource});

  @override
  Future<void> register(String email, String password) async {
    final RegisterEntity registerInfo = await dataSource.register(
      email,
      password,
    );
    final LoginEntity loginInfo = LoginEntity(
      accessToken: registerInfo.accessToken,
      refreshToken: "",
    );
    persistLoginTokens(loginInfo);
    loadAuthInfo(loginChangeNotifier);
  }
}
