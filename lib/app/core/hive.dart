import 'package:hive_flutter/adapters.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

class HiveInit {
  static Future<void> load() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(HistoryModelAdapter());
    await Hive.openBox<String>('currentUser');
    await Hive.openBox<UserModel>('users');
    await Hive.openBox<HistoryModel>('history');
  }
}
