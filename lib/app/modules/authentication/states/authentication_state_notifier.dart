import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/modules/authentication/states/authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier(this.authenticationRepository)
      : super(InitialAuthenticationState());
  final AuthenticationRepository authenticationRepository;

  void authentication(String login, String password) async {
    state = LoadingAuthenticationState();

    final authentication =
        await authenticationRepository.loginVirification(login, password);
    if (authentication) {
      state = Authenticated();
    } else {
      state = UnAuthenticated(errorMessage: 'Login ou senha inválido');
    }
  }
}
