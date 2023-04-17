import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier({required this.authenticationRepository})
      : super(InitialAuthenticationState());
  final AuthenticationRepository authenticationRepository;

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
}
