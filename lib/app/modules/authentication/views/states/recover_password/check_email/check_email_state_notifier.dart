import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/data/repositories/authentication_repository.dart';
import 'check_email_state.dart';

class CheckEmailStateNotifier extends StateNotifier<CheckEmailState> {
  CheckEmailStateNotifier({required this.authenticationRepository})
      : super(InitialCheckEmailState());
  final AuthenticationRepository authenticationRepository;

  void recoverPassword(String email) async {
    state = LoadingCheckEmailState();

    try {
      final result = await authenticationRepository.recoverPassword(email);
      state = SuccessCheckEmailState(data: result);
    } catch (e) {
      state = FailureCheckEmailState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
