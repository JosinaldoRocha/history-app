import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier({required this.registerRepository})
      : super(InitialLoginState());
  final RegisterRepository registerRepository;

  void load() async {
    state = LoadingLoginState();
    try {
      final result = await registerRepository.getAll();
      state = SuccessLoginState(data: result);
    } catch (e) {
      state = FailureLoginState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
