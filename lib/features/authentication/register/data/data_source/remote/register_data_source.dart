import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login/core/error/validator_response.dart';
import 'package:login/features/authentication/register/data/data_source/mock/register_fake_response.dart';
import 'package:login/features/authentication/register/data/model/register_model.dart';
import 'package:login/features/authentication/register/data/model/register_response_model.dart';
import 'package:login/features/authentication/register/domain/entity/register_entity.dart';

class RegisterRemoteDataSource with HttpResponseValidator {
  final Dio httpClient;

  RegisterRemoteDataSource({required this.httpClient});

  Future<RegisterResponseModel> register(RegisterEntity registerEntity) async {
    
    final deviceId = await RegisterModel.getDeviceId();
    final registerModel = RegisterModel(
      username: registerEntity.username,
      password: registerEntity.password,
      deviceId: deviceId,
      deviceType: Platform.isAndroid ? 'andriod' : 'ios',
      saveInfo: registerEntity.saveInfo,
    );


    final response = registerFakeResponse(registerModel);

    validatedResponse(response);

    return RegisterResponseModel(
      accessToken: response.data!["access_token"] as String,
      expirationDate: response.data!["expiration_date"] as String,
      id: response.data!['id']
    );
  }
}
