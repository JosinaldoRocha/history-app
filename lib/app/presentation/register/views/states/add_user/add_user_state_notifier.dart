import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/authentication_repository.dart';
import 'package:my_history_app/app/presentation/register/views/states/add_user/add_user_state.dart';

class AddUserStateNotifier extends StateNotifier<AddUserState> {
  AddUserStateNotifier(
    this.authRepository,
  ) : super(InitialAddUserState());
  final AuthenticationRepository authRepository;

  void load() async {
    state = LoadingAddUserState();
    try {
      state = SuccessAddUserState();
    } catch (e) {
      FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }

  void registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    state = LoadingAddUserState();
    try {
      await authRepository.signUp(
        name: name,
        email: email,
        password: password,
      );
      state = SuccessAddUserState();
    } catch (e) {
      state = FailureAddUserState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
