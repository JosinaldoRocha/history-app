import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/civil_status_state/civil_status_list_state.dart';

class CivilStatusListNotifier extends StateNotifier<CivilStatusListState> {
  CivilStatusListNotifier({required this.historyRepository})
      : super(InitialCivilStatusListState());
  final HistoryRepository historyRepository;

  void load() async {
    state = LoadingCivilStatusListState();
    try {
      final result = await historyRepository.getCivilStatusList();
      state = SuccessCivilStatusListState(data: result);
    } catch (e) {
      state =
          FailureCivilStatusListState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
