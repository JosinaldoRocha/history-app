// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/home/views/states/home_state.dart';
import 'package:my_history_app/app/modules/register/data/repositorys/register_repository.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier({required this.registerRepository})
      : super(InitialHomeState());
  final RegisterRepository registerRepository;

  void load() async {
    state = LoadingHomeState();
    try {
      final result = await registerRepository.getAll();
      state = SuccessHomeState(data: result);
    } catch (e) {
      state = FailureHomeState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
