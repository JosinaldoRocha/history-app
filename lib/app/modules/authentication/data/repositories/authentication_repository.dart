import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/register/data/models/register_model.dart';

class AuthenticationRepository {
  final box = Hive.box<UserModel>('users');
  final boxCurrentUser = Hive.box<String>('currentUser');

  Future<bool> loginVirification(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    final userList = box.values.toList();
    if (userList.any((element) =>
        element.userName == userName && element.password == password)) {
      boxCurrentUser.add(userName);
      return true;
    }
    return false;
  }

  Future<bool> userVerification() async {
    await Future.delayed(const Duration(seconds: 1));
    if (boxCurrentUser.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getCurrenUser() async {
    return boxCurrentUser.values.toString();
  }
}
