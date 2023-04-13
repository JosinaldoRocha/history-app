import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier({required this.authenticationRepository})
      : super(InitialAuthenticationState());
  final AuthenticationRepository authenticationRepository;

  void authentication() async {
    state = LoadingAuthenticationState();

    try {
      final result = await authenticationRepository.userVerification();
      if (result) {
        final user = await authenticationRepository.getCurrentUser();
        state = Authenticated();
      } else {
        state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
      }
    } catch (e) {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }

  void loadAutentication() async {
    state = LoadingAuthenticationState();

    try {
      final result = await authenticationRepository.userVerification();
      if (result) {
        state = Authenticated();
      } else {
        state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
      }
    } catch (erro) {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }

  void signIn(String userName, String password) async {
    state = LoadingAuthenticationState();
    try {
      final result = await authenticationRepository.signIn(userName, password);
      if (result != null) {
        state = Authenticated();
      }
    } catch (e) {
      state = UnAuthenticated(errorMessage: 'Login inválido');
    }
  }
}