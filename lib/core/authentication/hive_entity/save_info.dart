import 'package:hive_flutter/adapters.dart';

part 'save_info.g.dart';
@HiveType(typeId: 0)
class SaveInfo extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;

  SaveInfo({required this.id, required this.username, required this.password});
}
