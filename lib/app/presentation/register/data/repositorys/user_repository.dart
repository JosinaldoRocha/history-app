import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';

class UserRepository {
  final box = Hive.box<UserModel>('users');
  final historyBox = Hive.box<HistoryModel>('history');

  Future<List<UserModel>> getAll() async {
    //await Future.delayed(const Duration(seconds: 2));
    final values = box.values.toList();
    return values;
  }

  Future<void> addUser(UserModel item) async {
    await box.add(item);
  }

  Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<void> clearRegisters() async {
    await Future.delayed(const Duration(seconds: 2));
    await box.clear();
    await historyBox.clear();
  }
}
