abstract class DeleteHistoryState {}

class InitialDeleteHistoryState implements DeleteHistoryState {}

class LoadinglDeleteHistoryState implements DeleteHistoryState {}

class SuccessDeleteHistoryState implements DeleteHistoryState {}

class FailureDeleteHistoryState implements DeleteHistoryState {
  FailureDeleteHistoryState({required this.errorMessage});
  final String errorMessage;
}
