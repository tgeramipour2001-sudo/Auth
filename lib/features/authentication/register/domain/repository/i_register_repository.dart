import 'package:login/features/authentication/register/domain/entity/register_entity.dart';

abstract class IRegisterRepository {
  Future<void> register(RegisterEntity registerEntity);
}
