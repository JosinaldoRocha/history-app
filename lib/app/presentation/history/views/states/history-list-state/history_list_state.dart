import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';

abstract class HistoryListState {}

class InitialHistoryListState implements HistoryListState {}

class LoadingHistoryListState implements HistoryListState {}

class SuccessHistoryListState implements HistoryListState {
  SuccessHistoryListState({required this.data});
  final List<HistoryModel> data;
}

class FailureHistoryListState implements HistoryListState {
  FailureHistoryListState({required this.errorMessage});
  final String errorMessage;
}
