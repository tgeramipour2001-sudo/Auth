import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class RegisterModel {
  final String username;
  final String password;
  final String deviceId;
  final String deviceType;
  final bool saveInfo;

  RegisterModel({
    required this.username,
    required this.password,
    required this.deviceId,
    required this.saveInfo,
    required this.deviceType,
  });


  static Future<String> getDeviceId() async{
      final deviceInfo = DeviceInfoPlugin();

      if(Platform.isAndroid){
        final andriodInfo = await deviceInfo.androidInfo;
        return andriodInfo.id;
      }


      if(Platform.isIOS){
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor!;
      }

      return '';
  }
}
