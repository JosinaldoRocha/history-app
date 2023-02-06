import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/history_repository.dart';
import 'add_index_state.dart';

class AddIndexStateNotifier extends StateNotifier<AddIndexState> {
  AddIndexStateNotifier({required this.historyRepository})
      : super(InitialAddIndexState());
  final HistoryRepository historyRepository;

  void addIndex(int index) {
    state = LoadingAddIndexState();
    try {
      historyRepository.addIndex(index);
      state = SuccessAddIndexState();
    } catch (e) {
      state = FailureAddIndexState(errorMessage: 'Erro ao editar dados.');
    }
  }
}
