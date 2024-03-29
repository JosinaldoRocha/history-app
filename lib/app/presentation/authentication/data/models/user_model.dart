import 'package:cloud_firestore/cloud_firestore.dart';
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
  String? confirmPassword;
  @HiveField(6)
  String? id;
  @HiveField(7)
  String image;

  UserModel({
    required this.name,
    required this.surname,
    required this.userName,
    required this.eMail,
    required this.password,
    this.confirmPassword,
    this.id,
    required this.image,
  });

  Map<String, dynamic> toMap(String userId) {
    return {
      'name': name,
      'surname': surname,
      'user-name': userName,
      'email': eMail,
      'password': password,
      'id': userId,
    };
  }

  Map<String, dynamic> updateToMap(UserModel user) {
    return {
      'name': user.name,
      'surname': user.surname,
      'user-name': user.userName,
      'email': user.eMail,
      'password': user.password,
      'id': user.id,
      'image': user.image,
    };
  }

  factory UserModel.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> data) {
    return UserModel(
      name: (data.data()!["name"] ?? '') as String,
      surname: (data.data()!["surname"] ?? 0) as String,
      userName: (data.data()!["user-name"] ?? 0) as String,
      eMail: (data.data()!["email"] ?? 0) as String,
      password: (data.data()!["password"] ?? '') as String,
      id: (data.data()!["id"] ?? '') as String,
      image: (data.data()!["image"] ?? '') as String,
    );
  }
}
