import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/modules/history/views/states/delete-item-state/delete_item_state.dart';

class DeleteItemStateNotifier extends StateNotifier<DeleteItemState> {
  DeleteItemStateNotifier({required this.historyRepository})
      : super(InitialDeleteItemState());
  final HistoryRepository historyRepository;

  void deleteItem(HistoryModel item) async {
    state = LoadinglDeleteItemState();
    try {
      await historyRepository.deleteItem(item);
      state = SuccessDeleteItemState();
    } catch (e) {
      state = FailureDeleteItemState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
