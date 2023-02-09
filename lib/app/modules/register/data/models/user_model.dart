import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String fullName;
  @HiveField(1)
  String userName;
  @HiveField(2)
  String eMail;
  @HiveField(3)
  String password;
  @HiveField(4)
  String confirmPassword;

  UserModel({
    required this.fullName,
    required this.userName,
    required this.eMail,
    required this.password,
    required this.confirmPassword,
  });
}
