import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/views/states/add_image/add_image_history_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/add_image/add_image_history_state_notifier.dart';
import 'package:my_history_app/app/presentation/history/views/states/edit_history/edit_history_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/edit_history/edit_history_state_notifier.dart';
import '../data/repositories/history_repository.dart';
import '../views/states/add-history-state/add_history_state.dart';
import '../views/states/add-history-state/add_history_state_notifier.dart';
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
    StateNotifierProvider.autoDispose<HistoryStateNotifier, HistoryState>(
  (ref) => HistoryStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final addHistoryProvider =
    StateNotifierProvider.autoDispose<AddHistoryStateNotifier, AddHistoryState>(
  (ref) => AddHistoryStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final deleteItemProvider =
    StateNotifierProvider<DeleteItemStateNotifier, DeleteItemState>(
  (ref) => DeleteItemStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final civilListStatusProvider = StateNotifierProvider.autoDispose<
    CivilStatusListNotifier, CivilStatusListState>(
  (ref) => CivilStatusListNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final relationshipListProvider = StateNotifierProvider.autoDispose<
    RelationshipListNotifier, RelationshipListState>(
  (ref) => RelationshipListNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final listWhatHappenedProvider = StateNotifierProvider.autoDispose<
    ListWhatHappenedNotifier, ListWhatHappenedState>(
  (ref) => ListWhatHappenedNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final listOfTimesProvider =
    StateNotifierProvider.autoDispose<ListOfTimesNotifier, ListOfTimesState>(
  (ref) => ListOfTimesNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final periodListProvider =
    StateNotifierProvider<PeriodListStateNotifier, PeriodListState>(
  (ref) => PeriodListStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final editHistoryProvider = StateNotifierProvider.autoDispose<
    EditHistoryStateNotifier, EditHistoryState>(
  (ref) => EditHistoryStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);

final addImageProvider = StateNotifierProvider.autoDispose<
    AddImageHistoryStateNotifier, AddImageHistoryState>(
  (ref) => AddImageHistoryStateNotifier(
    historyRepository: ref.read(historyRepositoryProvider),
  ),
);
