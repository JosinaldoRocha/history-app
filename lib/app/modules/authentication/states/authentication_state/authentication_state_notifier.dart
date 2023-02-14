import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state/authentication_state.dart';

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
        state = Authenticated(data: user!);
      } else {
        state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
      }
    } catch (e) {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }

  void loginVirification(String userName, String password) async {
    state = LoadingAuthenticationState();

    try {
      await authenticationRepository.loginVerification(userName, password);
      final user = await authenticationRepository.getCurrentUser();
      state = Authenticated(data: user!);
    } catch (e) {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }
}
