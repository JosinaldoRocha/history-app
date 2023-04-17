import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';
import 'clear_register_stete.dart';

class ClearRegisterStateNotifier extends StateNotifier<ClearRegisterState> {
  ClearRegisterStateNotifier({required this.userRepository})
      : super(InitialClearRegisterState());
  final UserRepository userRepository;

  void clearRegisters() async {
    state = LoadingClearRegisterState();
    try {
      await userRepository.clearRegisters();
      state = SuccessClearRegisterState();
    } catch (e) {
      FailureClearRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
