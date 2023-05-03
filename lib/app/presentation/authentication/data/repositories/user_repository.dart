import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user_model.dart';

class UserRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

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

  Future<void> updateProfilePicture(UserModel user, String image) async {
    final userId = _firestore.collection('users').doc(user.id);
    final Reference reference =
        _storage.ref().child('profilePicture/').child(image);
    final UploadTask task = reference.putFile(File(image));
    await task.whenComplete(() => null);
    final imageUrl = await reference.getDownloadURL();
    await userId.update({'image': imageUrl});
  }

  Future<void> removeProfilePicture(UserModel user) async {
    final userId = _firestore.collection('users').doc(user.id);
    await userId.update({'image': ''});
  }
}
