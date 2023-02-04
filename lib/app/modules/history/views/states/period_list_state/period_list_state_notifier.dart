import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/modules/history/views/states/period_list_state/period_list_state.dart';

class PeriodListNotifier extends StateNotifier<PeriodListState> {
  PeriodListNotifier({required this.historyRepository})
      : super(InitialPeriodListState());
  final HistoryRepository historyRepository;

  void load() async {
    state = LoadingPeriodListState();
    try {
      final result = await historyRepository.getPeriodList();
      state = SuccessPeriodListState(data: result);
    } catch (e) {
      state = FailurePeriodListState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
