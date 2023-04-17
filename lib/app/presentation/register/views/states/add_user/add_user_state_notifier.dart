import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/register/views/states/add_user/add_user_state.dart';

class AddUserStateNotifier extends StateNotifier<AddUserState> {
  AddUserStateNotifier(
    this.authRepository,
  ) : super(InitialAddUserState());
  final AuthenticationRepository authRepository;

  void load() async {
    state = LoadingAddUserState();
    try {
      state = SuccessAddUserState();
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void signUp({
    required String name,
    required String email,
    required String password,
    required UserModel user,
  }) async {
    state = LoadingAddUserState();
    try {
      final result = await authRepository.signUp(
        name: name,
        email: email,
        password: password,
      );

      try {
        await authRepository.saveUser(user, result!);
        state = SuccessAddUserState();
      } catch (e) {
        state = FailureAddUserState(errorMessage: 'Erro ao carregar dados');
      }

      state = SuccessAddUserState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        state = FailureAddUserState(
            errorMessage: 'A conta já existe para esse e-mail.');
      }
      if (e.code == 'weak-password') {
        state = FailureAddUserState(errorMessage: 'Senha fraca.');
      }
    } catch (e) {
      state = FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
