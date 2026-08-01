import 'package:login/data/register.dart';

abstract class IRegisterDatSource {
  Future<RegisterInfo> register(String email, String password);
}
