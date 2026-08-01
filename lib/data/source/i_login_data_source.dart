import 'package:login/data/login.dart';

abstract class ILoginDataSource {
  Future<LoginInfo> login(String username, String password);

}
