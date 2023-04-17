import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/home/views/states/home_state.dart';
import 'package:my_history_app/app/presentation/authentication/data/repositories/user_repository.dart';

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
