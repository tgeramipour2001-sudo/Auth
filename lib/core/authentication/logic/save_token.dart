//save token

import 'package:login/features/authentication/login/domain/entity/login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SaveToken {
  Future<void> persistLoginTokens(LoginEntity loginInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("access_token", loginInfo.accessToken);
    sharedPreferences.setString("refresh_token", loginInfo.refreshToken);
  }

  Future<void> loadAuthInfo(dynamic loginChangeNotifier) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';
    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';

    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      loginChangeNotifier.value = LoginEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
  }
}
