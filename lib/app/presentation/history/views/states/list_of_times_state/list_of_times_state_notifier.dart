import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/presentation/history/views/states/list_of_times_state/list_of_times_state.dart';

class ListOfTimesNotifier extends StateNotifier<ListOfTimesState> {
  ListOfTimesNotifier({required this.historyRepository})
      : super(InitialListOfTimesState());
  final HistoryRepository historyRepository;

  void load() async {
    state = LoadingListOfTimesState();
    try {
      final result = await historyRepository.getListOfTimes();
      state = SuccessListOfTimesState(data: result);
    } catch (e) {
      state = FailureListOfTimesState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
