import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/list_what_happened_state/list_what_happened_state.dart';

class ListWhatHappenedNotifier extends StateNotifier<ListWhatHappenedState> {
  ListWhatHappenedNotifier({required this.historyRepository})
      : super(InitialListWhatHappenedState());
  final HistoryRepository historyRepository;

  void load() async {
    state = LoadingListWhatHappenedState();
    try {
      final result = await historyRepository.getListWhatHappened();
      state = SuccessListWhatHappenedState(data: result);
    } catch (e) {
      state =
          FailureListWhatHappenedState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
