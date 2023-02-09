import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier(this.authenticationRepository)
      : super(InitialAuthenticationState());
  final AuthenticationRepository authenticationRepository;

  void authentication() async {
    state = LoadingAuthenticationState();

    try {
      final result = await authenticationRepository.userVerification();
      if (result) {
        final user = await authenticationRepository.getCurrenUser();
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
      await authenticationRepository.loginVirification(userName, password);
      final user = await authenticationRepository.getCurrenUser();
      state = Authenticated(data: user!);
    } catch (e) {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }
}
