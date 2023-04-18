abstract class AddHistoryState {}

class InitialAddHistoryState implements AddHistoryState {}

class LoadingAddHistoryState implements AddHistoryState {}

class SuccessAddHistoryState implements AddHistoryState {}

class FailureAddHistoryState implements AddHistoryState {
  FailureAddHistoryState({required this.errorMessage});
  final String errorMessage;
}
