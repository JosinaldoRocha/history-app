import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import '../models/user_model.dart';

class AuthenticationRepository {
  final box = Hive.box<UserModel>('users');
  final boxCurrentUser = Hive.box<UserModel>('currentUser');
  final _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    return user;
  }

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    User? user;
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    await user!.updateDisplayName(name);
    await user.reload();
    user = _auth.currentUser;

    return user?.uid;
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  void logout() async {
    _auth.signOut();
  }

  Future<void> saveUser(UserModel user, String userId) async {
    final collection = FirebaseFirestore.instance.collection('users');
    await collection.doc(userId).set(user.toMap(userId));
  }

  Future<void> deleteCurrentUser() async {
    await _auth.currentUser!.delete();
  }

  Future<void> deleteUserData(String id) async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(id).delete();
  }
}
