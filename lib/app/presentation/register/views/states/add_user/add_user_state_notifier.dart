import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/register/views/states/add_user/add_user_state.dart';

class AddUserStateNotifier extends StateNotifier<AddUserState> {
  AddUserStateNotifier(
    this.authRepository,
  ) : super(InitialAddUserState());
  //final UserRepository userRepository;
  final AuthenticationRepository authRepository;

  void load() async {
    state = LoadingAddUserState();
    try {
      List<UserModel> data = [];
      // final result = await userRepository.getAll();
      state = SuccessAddUserState(data: data);
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void registerUsingEmailPassword(
    String email,
    String password,
  ) async {
    state = LoadingAddUserState();
    try {
      await authRepository.signUp(
        email,
        password,
      );
      List<UserModel> data = [];
      //final result = await userRepository.getAll();
      state = SuccessAddUserState(data: data);
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
