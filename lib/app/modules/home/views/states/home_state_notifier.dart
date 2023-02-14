import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/user_repository.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier({required this.userRepository}) : super(InitialHomeState());
  final UserRepository userRepository;

  void load() async {
    state = LoadingHomeState();
    try {
      final result = await userRepository.getAll();
      state = SuccessHomeState(data: result);
    } catch (e) {
      state = FailureHomeState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
