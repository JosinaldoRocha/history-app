import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');

  Future<List<UserModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    final values = box.values.toList();
    return values;
  }

  Future<void> addUser(UserModel item) async {
    await box.add(item);
  }

  Future<void> clearRegisters() async {
    await Future.delayed(const Duration(seconds: 2));
    await box.clear();
  }
}
