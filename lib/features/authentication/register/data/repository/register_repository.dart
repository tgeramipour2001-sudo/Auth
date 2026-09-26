import 'package:flutter/material.dart';
import 'package:login/core/authentication/logic/save_token.dart';
import 'package:login/features/authentication/login/domain/entity/login_entity.dart';
import 'package:login/features/authentication/register/data/data_source/db/register_local_data_source.dart';
import 'package:login/features/authentication/register/data/data_source/remote/register_data_source.dart';
import 'package:login/features/authentication/register/data/model/register_response_model.dart';
import 'package:login/features/authentication/register/domain/entity/register_entity.dart';
import 'package:login/features/authentication/register/domain/repository/i_register_repository.dart';

class RegisterRepository with SaveToken implements IRegisterRepository {
  static final ValueNotifier<LoginEntity?> loginChangeNotifier = ValueNotifier(
    null,
  );
  final RegisterRemoteDataSource dataSource;
  final RegisterLocalDataSource localDataSource;

  RegisterRepository({required this.dataSource, required this.localDataSource});

  @override
  Future<void> register(RegisterEntity registerEntity) async {
    final RegisterResponseModel registerInfo = await dataSource.register(
      registerEntity,
    );
    final LoginEntity loginInfo = LoginEntity(
      accessToken: registerInfo.accessToken,
      refreshToken: "",
    );
    persistLoginTokens(loginInfo);
    loadAuthInfo(loginChangeNotifier);

    //ذخیره اطلاعات کاربر در دیتابیس دستگاه
    if (registerEntity.saveInfo) {
      await localDataSource.saveInfoToDB(registerEntity);
    }
  }
}
