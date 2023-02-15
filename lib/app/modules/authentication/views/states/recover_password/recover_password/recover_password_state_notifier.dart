import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';

class RecoverPasswordStateNotifier extends StateNotifier<RecoverPasswordState> {
  RecoverPasswordStateNotifier({required this.userRepository})
      : super(InitialRecoverPasswordState());
  final UserRepository userRepository;

  void load() async {
    state = LoadingRecoverPasswordState();

    try {
      final result = await userRepository.getAll();
      state = SuccessRecoverPasswordState(data: result);
    } catch (e) {
      state =
          FailureRecoverPasswordState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
