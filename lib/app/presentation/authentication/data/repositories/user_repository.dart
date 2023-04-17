import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');
  final historyBox = Hive.box<HistoryModel>('history');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<UserModel>> getAll() async {
    //await Future.delayed(const Duration(seconds: 2));
    final values = box.values.toList();
    return values;
  }

  User? getCurrentUser() {
    final User? user = _auth.currentUser;
    final collection = FirebaseFirestore.instance.collection('users');

    if (user != null) {
      return user;
    } else {
      return null;
    }
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

class FirebaseUser {}
