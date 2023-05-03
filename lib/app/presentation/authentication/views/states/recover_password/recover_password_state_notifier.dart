import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password_state.dart';

class RecoverPasswordStateNotifier extends StateNotifier<RecoverPasswordState> {
  RecoverPasswordStateNotifier({required this.userRepository})
      : super(InitialRecoverPasswordState());
  final AuthenticationRepository userRepository;

  void resetPassword(String email) async {
    state = LoadingRecoverPasswordState();

    try {
      await userRepository.resetPassword(email);
      state = SuccessRecoverPasswordState();
    } catch (e) {
      state = FailureRecoverPasswordState(errorMessage: 'Erro ao enviar email');
    }
  }
}
