import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/history-list-state/history_list_state.dart';

class HistoryListStateNotifier extends StateNotifier<HistoryListState> {
  HistoryListStateNotifier({required this.historyRepository})
      : super(InitialHistoryListState());
  final HistoryRepository historyRepository;

  void load(String id) async {
    state = LoadingHistoryListState();
    try {
      final success = await historyRepository.getAll(id);
      state = SuccessHistoryListState(data: success);
    } catch (e) {
      state = FailureHistoryListState(errorMessage: 'Erro ao carregar dados.');
    }
  }
}
