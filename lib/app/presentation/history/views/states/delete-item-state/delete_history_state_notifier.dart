import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/delete-item-state/delete_history_state.dart';

class DeleteHistoryStateNotifier extends StateNotifier<DeleteHistoryState> {
  DeleteHistoryStateNotifier({required this.historyRepository})
      : super(InitialDeleteHistoryState());
  final HistoryRepository historyRepository;

  void deleteHistory(String id) async {
    state = LoadinglDeleteHistoryState();
    try {
      await historyRepository.deleteHistory(id);
      state = SuccessDeleteHistoryState();
    } catch (e) {
      state = FailureDeleteHistoryState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
