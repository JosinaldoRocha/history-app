import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/modules/history/views/states/add-item-state/add_item_state.dart';

class AddItemStateNotifier extends StateNotifier<AddItemState> {
  AddItemStateNotifier({required this.historyRepository})
      : super(InitialAddItemState());
  final HistoryRepository historyRepository;

  void addItem(int key, HistoryModel item) {
    state = LoadingAddItemState();
    try {
      historyRepository.addItem(key, item);
      state = SuccessAddItemState();
    } catch (e) {
      state = FailureAddItemState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
