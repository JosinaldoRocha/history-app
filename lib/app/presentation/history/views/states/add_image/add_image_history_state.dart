abstract class AddImageHistoryState {}

class InitialAddImageHistoryState implements AddImageHistoryState {}

class LoadingAddImageHistoryState implements AddImageHistoryState {}

class SuccessAddImageHistoryState implements AddImageHistoryState {
  SuccessAddImageHistoryState({required this.data});
  final String data;
}

class FailureAddImageHistoryState implements AddImageHistoryState {
  FailureAddImageHistoryState({required this.errorMessage});
  final String errorMessage;
}
