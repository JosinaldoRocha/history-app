import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(InitialLoginState());

  void load() async {
    state = LoadingLoginState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = SuccessLoginState();
    } catch (e) {
      state = FailureLoginState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
