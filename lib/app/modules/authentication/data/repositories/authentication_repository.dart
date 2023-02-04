import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/register/data/models/register_model.dart';

class AuthenticationRepository {
  final box = Hive.box<UserModel>('users');

  Future<bool> loginVirification(String login, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    final userList = box.values.toList();
    if (!userList.any(
        (element) => element.eMail == login && element.password == password)) {
      return false;
    }
    return true;
  }
}
