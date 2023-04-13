import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');
  final historyBox = Hive.box<HistoryModel>('history');

  Future<List<UserModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 2));
    final values = box.values.toList();
    return values;
  }

  Future<void> addUser(UserModel item) async {
    await box.add(item);
  }

  Future<void> clearRegisters() async {
    await Future.delayed(const Duration(seconds: 2));
    await box.clear();
    await historyBox.clear();
  }
}
