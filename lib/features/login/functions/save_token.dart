  //save token
  import 'package:login/features/login/entity/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


mixin SaveToken {
Future<void> persistLoginTokens(LoginInfo loginInfo) async {
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
      loginChangeNotifier.value = LoginInfo(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
  }
}