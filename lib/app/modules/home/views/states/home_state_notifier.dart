import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(InitialHomeState());

  void load() async {
    state = LoadingHomeState();
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = SuccessHomeState();
    } catch (e) {
      state = FailureHomeState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
