import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

class AuthenticationRepository {
  final box = Hive.box<UserModel>('users');
  final boxCurrentUser = Hive.box<UserModel>('currentUser');

  Future<bool> loginVerification(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    final userList = box.values.toList();
    if (userList.any((element) =>
        element.userName == userName && element.password == password)) {
      final currentUser =
          userList.firstWhere((element) => element.userName == userName);

      final user = UserModel(
        name: currentUser.name,
        surname: currentUser.surname,
        userName: currentUser.userName,
        eMail: currentUser.eMail,
        password: currentUser.password,
        confirmPassword: currentUser.confirmPassword,
        id: currentUser.id,
      );
      boxCurrentUser.add(user);
      return true;
    }
    return false;
  }

  Future<bool> userVerification() async {
    await Future.delayed(const Duration(seconds: 2));
    if (boxCurrentUser.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    return boxCurrentUser.get(0);
  }

  void logout() {
    boxCurrentUser.clear();
  }
}
