import 'package:login/data/login.dart';
import 'package:login/data/register.dart';

abstract class ILoginDataSource {
  Future<LoginInfo> login(String username, String password);
  Future<RegisterInfo> register(String email, String password);
}
