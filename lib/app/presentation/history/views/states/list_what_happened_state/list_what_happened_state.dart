abstract class ListWhatHappenedState {}

class InitialListWhatHappenedState implements ListWhatHappenedState {}

class LoadingListWhatHappenedState implements ListWhatHappenedState {}

class SuccessListWhatHappenedState implements ListWhatHappenedState {
  SuccessListWhatHappenedState({required this.data});
  final List<String> data;
}

class FailureListWhatHappenedState implements ListWhatHappenedState {
  FailureListWhatHappenedState({required this.errorMessage});
  final String errorMessage;
}
