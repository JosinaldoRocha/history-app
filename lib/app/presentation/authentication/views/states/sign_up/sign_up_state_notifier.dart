import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_up/sign_up_state.dart';
import '../../../data/models/user_model.dart';

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  SignUpStateNotifier(this.authRepository) : super(InitialSignUpState());
  final AuthenticationRepository authRepository;

  void signUp({
    required String name,
    required String email,
    required String password,
    required UserModel user,
  }) async {
    try {
      final result = await authRepository.signUp(
        name: name,
        email: email,
        password: password,
      );

      await authRepository.saveUser(user, result!);
      state = SuccessSignUpState();

      state = SuccessSignUpState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        state = FailureSignUpState(
            errorMessage: 'A conta já existe para esse e-mail.');
      }
      if (e.code == 'weak-password') {
        state = FailureSignUpState(errorMessage: 'Senha fraca.');
      }
    } catch (e) {
      state = FailureSignUpState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
