import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';
import 'clear_register_stete.dart';

class ClearRegisterStateNotifier extends StateNotifier<ClearRegisterState> {
  ClearRegisterStateNotifier({required this.registerRepository})
      : super(InitialClearRegisterState());
  final RegisterRepository registerRepository;

  void clearRegister() async {
    state = LoadingClearRegisterState();
    try {
      await registerRepository.clearRegister();
      state = SuccessClearRegisterState();
    } catch (e) {
      FailureClearRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
