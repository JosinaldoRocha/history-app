import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');
  final historyBox = Hive.box<HistoryModel>('history');
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<UserModel>> getAll() async {
    final values = box.values.toList();
    return values;
  }

  Future<UserModel> getCurrentUser() async {
    final docRef = _firestore.collection('users').doc(_auth.currentUser!.uid);
    final docSnapshot = await docRef.get();
    final user = UserModel.fromSnapShot(docSnapshot);
    return user;
  }

  Future<User?> checkUser() async {
    final user = _auth.currentUser;
    return user;
  }

  Future<void> updateUser(UserModel user) async {
    final document = _firestore.collection('users').doc(user.id);
    await document.update(user.updateToMap(user));
  }

  Future<UserModel> updateProfilePicture(UserModel user, String image) async {
    final userId = _firestore.collection('users').doc(user.id);
    final Reference reference =
        _storage.ref().child('profilePicture/${userId.id}');
    final UploadTask task = reference.putFile(File(image));
    await task.whenComplete(() => null);
    final imageUrl = await reference.getDownloadURL();
    await userId.update({'image': imageUrl});
    return user;
  }

  Future<void> clearRegisters() async {
    await Future.delayed(const Duration(seconds: 2));
    await box.clear();
    await historyBox.clear();
  }
}
