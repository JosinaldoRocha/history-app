import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'logout_state.dart';

class LogoutStateNotifier extends StateNotifier<LogoutState> {
  LogoutStateNotifier({required this.authenticationRepository})
      : super(InitialLogoutState());
  final AuthenticationRepository authenticationRepository;

  void logout() async {
    state = LoadingLogoutState();

    try {
      authenticationRepository.logout();
      state = SuccessLogoutState();
    } catch (e) {
      state = FailureLogoutState(errorMessage: 'Login ou senha inválido');
    }
  }
}
