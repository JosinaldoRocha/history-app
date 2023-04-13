import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String surname;
  @HiveField(2)
  String userName;
  @HiveField(3)
  String eMail;
  @HiveField(4)
  String password;
  @HiveField(5)
  String confirmPassword;
  @HiveField(6)
  int id;

  UserModel({
    required this.name,
    required this.surname,
    required this.userName,
    required this.eMail,
    required this.password,
    required this.confirmPassword,
    required this.id,
  });
}
