abstract class ListOfTimesState {}

class InitialListOfTimesState implements ListOfTimesState {}

class LoadingListOfTimesState implements ListOfTimesState {}

class SuccessListOfTimesState implements ListOfTimesState {
  SuccessListOfTimesState({required this.data});
  final List<String> data;
}

class FailureListOfTimesState implements ListOfTimesState {
  FailureListOfTimesState({required this.errorMessage});
  final String errorMessage;
}
