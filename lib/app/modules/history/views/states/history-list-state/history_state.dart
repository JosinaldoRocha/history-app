import 'package:my_history_app/app/modules/history/data/models/history_model.dart';

abstract class HistoryState {}

class InitialHistoryState implements HistoryState {}

class LoadingHistoryState implements HistoryState {}

class SuccessHistoryState implements HistoryState {
  SuccessHistoryState({required this.data});
  final List<HistoryModel> data;
}

class FailureHistoryState implements HistoryState {
  FailureHistoryState({required this.errorMessage});
  final String errorMessage;
}
