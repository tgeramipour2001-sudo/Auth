import 'package:login/features/register/entity/register.dart';

abstract class IRegisterDatSource {
  Future<RegisterInfo> register(String email, String password);
}
