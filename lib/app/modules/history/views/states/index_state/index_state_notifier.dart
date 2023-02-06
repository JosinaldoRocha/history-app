import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/views/states/index_state/index_state.dart';
import '../../../data/repositories/history_repository.dart';

class IndexStateNotifier extends StateNotifier<IndexState> {
  IndexStateNotifier({required this.historyRepository})
      : super(InitialIndexState());
  final HistoryRepository historyRepository;

  void load() {
    state = LoadingIndexState();
    try {
      final result = historyRepository.getIndex();
      state = SuccessIndexState(data: result);
    } catch (e) {
      state = FailureIndexState(errorMessage: 'Erro ao editar dados.');
    }
  }
}
