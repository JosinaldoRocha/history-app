import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';

class AuthenticationRepository {
  final box = Hive.box<UserModel>('users');
  final boxCurrentUser = Hive.box<UserModel>('currentUser');
  final _auth = FirebaseAuth.instance;

  // Future<bool> loginVerification(String userName, String password) async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   final userList = box.values.toList();
  //   if (userList.any((element) =>
  //       element.userName == userName && element.password == password)) {
  //     final currentUser =
  //         userList.firstWhere((element) => element.userName == userName);

  //     final user = UserModel(
  //       name: currentUser.name,
  //       surname: currentUser.surname,
  //       userName: currentUser.userName,
  //       eMail: currentUser.eMail,
  //       password: currentUser.password,
  //       confirmPassword: currentUser.confirmPassword,
  //       id: currentUser.id,
  //     );
  //     boxCurrentUser.add(user);
  //     return true;
  //   }
  //   return false;
  // }

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    return user;

    // try { }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     return 'Usuário não encontrado.';
    //   } else if (e.code == 'wrong-password') {
    //     return 'Senha incorreta.';
    //   } else {
    //     return e.message;
    //   }
    // } catch (e) {
    //   return e.toString();
    //}
  }

  Future<UserModel> recoverPassword(String email) async {
    await Future.delayed(const Duration(seconds: 3));
    final values = box.values.toList();
    final currentUser = values.firstWhere((element) => element.eMail == email);

    return currentUser;
  }

  Future<bool> userVerification() async {
    await Future.delayed(const Duration(seconds: 3));

    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    return boxCurrentUser.get(0);
  }

  void logout() async {
    _auth.signOut();
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

  Future<void> saveUser(UserModel user, String userId) async {
    final collection = FirebaseFirestore.instance.collection('users');

    Map<String, dynamic> userData = {
      'name': user.name,
      'surname': user.surname,
      'user-name': user.userName,
      'email': user.eMail,
      'password': user.password,
      'id': userId,
    };

    collection
        .doc(userId)
        .set(userData)
        .then((value) => print("User data added"))
        .catchError((error) => print("Failed to add user data: $error"));
  }
}
