import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/register_model.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';
import 'package:my_history_app/app/modules/register/views/states/register_state.dart';

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier(this.registerRepository)
      : super(InitialRegisterState());
  final RegisterRepository registerRepository;

  void addRegister(UserModel item) async {
    state = LoadingRegisterState();
    try {
      state = SuccessRegisterState();
      await registerRepository.addRegister(item);
    } catch (e) {
      FailureRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
