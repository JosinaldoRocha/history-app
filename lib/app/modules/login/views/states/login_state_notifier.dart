import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier({required this.userRepository})
      : super(InitialLoginState());
  final UserRepository userRepository;

  void load() async {
    state = LoadingLoginState();
    try {
      final result = await userRepository.getAll();
      state = SuccessLoginState(data: result);
    } catch (e) {
      state = FailureLoginState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
