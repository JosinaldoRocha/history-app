import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'check_email_state.dart';

class CheckEmailStateNotifier extends StateNotifier<CheckEmailState> {
  CheckEmailStateNotifier({required this.authenticationRepository})
      : super(InitialCheckEmailState());
  final AuthenticationRepository authenticationRepository;

  void recoverPassword(String email) async {
    state = LoadingCheckEmailState();

    try {
      await authenticationRepository.resetPassword(email);
      state = SuccessCheckEmailState();
    } catch (e) {
      state = FailureCheckEmailState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
