import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';
import 'package:my_history_app/app/modules/register/views/states/add_register/add_register_state.dart';

class AddRegisterStateNotifier extends StateNotifier<AddRegisterState> {
  AddRegisterStateNotifier(this.registerRepository)
      : super(InitialAddRegisterState());
  final RegisterRepository registerRepository;

  void load() async {
    state = LoadingAddRegisterState();
    try {
      final result = await registerRepository.getAll();
      state = SuccessAddRegisterState(data: result);
    } catch (e) {
      FailureAddRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void addRegister(UserModel item) async {
    state = LoadingAddRegisterState();
    try {
      await registerRepository.addRegister(item);
      final result = await registerRepository.getAll();
      state = SuccessAddRegisterState(data: result);
    } catch (e) {
      FailureAddRegisterState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
