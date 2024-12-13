import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String password;
  @HiveField(2)
  String email;
  UserModel({required this.name, required this.email, required this.password});
}
