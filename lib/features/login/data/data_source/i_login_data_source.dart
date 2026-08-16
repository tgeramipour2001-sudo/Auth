import 'package:login/features/login/entity/login.dart';

abstract class ILoginDataSource {
  Future<LoginInfo> login(String username, String password);

}
