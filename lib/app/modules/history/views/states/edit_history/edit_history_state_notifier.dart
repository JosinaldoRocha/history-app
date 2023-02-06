import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/views/states/edit_history/edit_history_state.dart';
import '../../../data/repositories/history_repository.dart';

class EditHistoryStateNotifier extends StateNotifier<EditHistoryState> {
  EditHistoryStateNotifier({required this.historyRepository})
      : super(InitialEditHistoryState());
  final HistoryRepository historyRepository;

  void editHistory(int index, HistoryModel history) async {
    state = LoadingEditHistoryState();
    try {
      await historyRepository.editHistory(index, history);
      state = SuccessEditHistoryState();
    } catch (e) {
      state = FailureEditHistoryState(errorMessage: 'Erro ao editar dados.');
    }
  }
}
