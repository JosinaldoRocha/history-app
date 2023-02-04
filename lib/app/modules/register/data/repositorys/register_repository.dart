import 'package:hive/hive.dart';
import 'package:my_history_app/app/modules/register/data/models/register_model.dart';

class RegisterRepository {
  final box = Hive.box<UserModel>('users');

  Future<List<UserModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    final values = box.values.toList();
    return values;
  }

  Future<void> addRegister(UserModel item) async {
    await box.add(item);
  }
}
