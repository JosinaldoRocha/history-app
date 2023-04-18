import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/add-history-state/add_history_state.dart';

class AddHistoryStateNotifier extends StateNotifier<AddHistoryState> {
  AddHistoryStateNotifier({required this.historyRepository})
      : super(InitialAddHistoryState());
  final HistoryRepository historyRepository;

  void addHistory(HistoryModel history) async {
    state = LoadingAddHistoryState();
    try {
      await historyRepository.addHistory(history);
      state = SuccessAddHistoryState();
    } catch (e) {
      state = FailureAddHistoryState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
