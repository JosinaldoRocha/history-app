abstract class EditHistoryState {}

class InitialEditHistoryState implements EditHistoryState {}

class LoadingEditHistoryState implements EditHistoryState {}

class SuccessEditHistoryState implements EditHistoryState {}

class FailureEditHistoryState implements EditHistoryState {
  FailureEditHistoryState({required this.errorMessage});
  final String errorMessage;
}
