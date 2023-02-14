import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';
import 'package:my_history_app/app/modules/register/views/states/add_user/add_user_state.dart';

class AddUserStateNotifier extends StateNotifier<AddUserState> {
  AddUserStateNotifier(this.userRepository) : super(InitialAddUserState());
  final UserRepository userRepository;

  void load() async {
    state = LoadingAddUserState();
    try {
      final result = await userRepository.getAll();
      state = SuccessAddUserState(data: result);
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void addUser(UserModel item) async {
    state = LoadingAddUserState();
    try {
      await userRepository.addUser(item);
      final result = await userRepository.getAll();
      state = SuccessAddUserState(data: result);
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
