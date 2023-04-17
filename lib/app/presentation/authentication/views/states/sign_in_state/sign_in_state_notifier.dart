import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_in_state/sign_in_state.dart';

class SignInStateNotifier extends StateNotifier<SignInState> {
  SignInStateNotifier({required this.authenticationRepository})
      : super(InitialSignInState());
  final AuthenticationRepository authenticationRepository;

  void signIn(String userName, String password) async {
    state = LoadingSignInState();

    try {
      final result = await authenticationRepository.signIn(userName, password);
      if (result != null) {
        state = SuccessSignInState();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        state =
            FailureSignInState(errorMessage: 'E-mail e senha não correspondem');
      }
      if (e.code == 'user-disabled') {
        state = FailureSignInState(errorMessage: 'Usuário desabilitado');
      }
      if (e.code == 'user-not-found') {
        state = FailureSignInState(
            errorMessage: 'Não há nenhum usário com esse e-mail');
      }
    } catch (e) {
      state = FailureSignInState(errorMessage: 'Login inválido');
    }
  }
}
