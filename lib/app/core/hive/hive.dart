import 'package:hive_flutter/adapters.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../../presentation/authentication/data/models/user_model.dart';

class HiveInit {
  static Future<void> load() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(HistoryModelAdapter());
    await Hive.openBox<UserModel>('currentUser');
    await Hive.openBox<UserModel>('users');
    await Hive.openBox<HistoryModel>('history');
  }
}
