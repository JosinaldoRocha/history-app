import 'package:hive/hive.dart';
part 'register_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double age;
  @HiveField(2)
  String eMail;
  @HiveField(3)
  String password;
  @HiveField(4)
  String confirmPassword;

  UserModel({
    required this.name,
    required this.age,
    required this.eMail,
    required this.password,
    required this.confirmPassword,
  });
}
