import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/history_repository.dart';
import '../views/states/add-item-state/add_item_state.dart';
import '../views/states/add-item-state/add_item_state_notifier.dart';
import '../views/states/civil_status_state/civil_status_list_state.dart';
import '../views/states/civil_status_state/civil_status_list_state_notifier.dart';
import '../views/states/delete-item-state/delete_item_state.dart';
import '../views/states/delete-item-state/delete_item_state_notifier.dart';
import '../views/states/history-list-state/history_state.dart';
import '../views/states/history-list-state/history_state_notifier.dart';
import '../views/states/list_of_times_state/list_of_times_state.dart';
import '../views/states/list_of_times_state/list_of_times_state_notifier.dart';
import '../views/states/list_what_happened_state/list_what_happened_state.dart';
import '../views/states/list_what_happened_state/list_what_happened_state_notifier.dart';
import '../views/states/period_list_state/period_list_state.dart';
import '../views/states/relationship_list_state/relationship_list_state.dart';
import '../views/states/relationship_list_state/relationship_list_state_notifier.dart';
import '../views/states/period_list_state/period_list_state_notifier.dart';

final historyRepositoryProvider = Provider(
  (ref) => HistoryRepository(),
);

final historyProvider =
    StateNotifierProvider<HistoryStateNotifier, HistoryState>(
  (ref) => HistoryStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final addItemProvider =
    StateNotifierProvider<AddItemStateNotifier, AddItemState>(
  (ref) => AddItemStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final deleteItemProvider =
    StateNotifierProvider<DeleteItemStateNotifier, DeleteItemState>(
  (ref) => DeleteItemStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final civilListStatusProvider =
    StateNotifierProvider<CivilStatusListNotifier, CivilStatusListState>(
  (ref) => CivilStatusListNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final relationshipListProvider =
    StateNotifierProvider<RelationshipListNotifier, RelationshipListState>(
  (ref) => RelationshipListNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final listWhatHappenedProvider =
    StateNotifierProvider<ListWhatHappenedNotifier, ListWhatHappenedState>(
  (ref) => ListWhatHappenedNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final listOfTimesProvider =
    StateNotifierProvider<ListOfTimesNotifier, ListOfTimesState>(
  (ref) => ListOfTimesNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final periodListProvider =
    StateNotifierProvider<PeriodListNotifier, PeriodListState>(
  (ref) => PeriodListNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);
