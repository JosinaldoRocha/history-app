import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/history-list-state/history_state.dart';

class HistoryStateNotifier extends StateNotifier<HistoryState> {
  HistoryStateNotifier({required this.historyRepository})
      : super(InitialHistoryState());
  final HistoryRepository historyRepository;

  void load(int id) async {
    state = LoadingHistoryState();
    try {
      final success = await historyRepository.getAll(id);
      state = SuccessHistoryState(data: success);
    } catch (e) {
      state = FailureHistoryState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
