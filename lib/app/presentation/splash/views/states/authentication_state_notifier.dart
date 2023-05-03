import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../authentication/data/repositories/user_repository.dart';
import 'authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier({required this.userRepository})
      : super(InitialAuthenticationState());
  final UserRepository userRepository;

  void loadAutentication() async {
    state = LoadingAuthenticationState();

    try {
      await Future.delayed(const Duration(seconds: 1));
      final user = await userRepository.checkUser();
      if (user != null) {
        final result = await userRepository.getCurrentUser();
        state = Authenticated(data: result);
      } else {
        state = UnAuthenticated();
      }
    } catch (erro) {
      state = UnAuthenticated(errorMessage: 'Erro ao carregar os dados');
    }
  }
}
