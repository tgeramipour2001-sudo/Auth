import 'package:hive_flutter/adapters.dart';
import 'package:login/core/authentication/hive_entity/save_info.dart';
import 'package:login/features/authentication/register/domain/entity/register_entity.dart';

class RegisterLocalDataSource {
  final Box<SaveInfo> saveInfoBox;

  RegisterLocalDataSource({required this.saveInfoBox});

  Future<void> saveInfoToDB(RegisterEntity registerEntity) async {
    final saveInfo = SaveInfo(
      id: 1,
      username: registerEntity.username,
      password: registerEntity.password,
    );

    await saveInfoBox.put(1, saveInfo);
  }
}
