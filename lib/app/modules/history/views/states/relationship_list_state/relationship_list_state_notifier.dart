import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/repositories/history_repository.dart';
import 'package:my_history_app/app/modules/history/views/states/relationship_list_state/relationship_list_state.dart';

class RelationshipListNotifier extends StateNotifier<RelationshipListState> {
  RelationshipListNotifier({required this.historyRepository})
      : super(InitialRelationshipListState());
  final HistoryRepository historyRepository;

  void load() async {
    state = LoadingRelationshipListState();
    try {
      final result = await historyRepository.getRelationshipList();
      state = SuccessRelationshipListState(data: result);
    } catch (e) {
      state =
          FailureRelationshipListState(errorMessage: 'Erro ao carregar dados');
    }
  }
}
