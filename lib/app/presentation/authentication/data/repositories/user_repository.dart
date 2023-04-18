import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');
  final historyBox = Hive.box<HistoryModel>('history');
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getAll() async {
    final values = box.values.toList();
    return values;
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    final docRef = _firestore.collection('users').doc(_auth.currentUser!.uid);
    final docSnapshot = await docRef.get();
    final user = docSnapshot.data();
    return user!;
  }

  Future<User?> checkUser() async {
    final user = _auth.currentUser;
    return user;
  }

  Future<void> clearRegisters() async {
    await Future.delayed(const Duration(seconds: 2));
    await box.clear();
    await historyBox.clear();
  }
}
