import 'package:flutter/widgets.dart';
import 'package:login/core/Authentication/Function/save_token.dart';
import 'package:login/features/Authentication/Login/Data/Data_Source/Remote/login_data_source.dart';
import 'package:login/features/Authentication/Login/Domain/Entity/login_entity.dart';
import 'package:login/features/Authentication/Login/Domain/Repository/i_login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository with SaveToken implements ILoginRepository {
  static final ValueNotifier<LoginEntity?> loginChangeNotifier = ValueNotifier(
    null,
  );

  final LoginRemoteDataSource dataSource;

  LoginRepository({required this.dataSource});

  @override
  Future<void> login(String username, String password) async {
    final LoginEntity loginEntity = await dataSource.login(username, password);
    persistLoginTokens(loginEntity);
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
