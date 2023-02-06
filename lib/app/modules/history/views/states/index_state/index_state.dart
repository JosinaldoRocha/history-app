abstract class IndexState {}

class InitialIndexState implements IndexState {}

class LoadingIndexState implements IndexState {}

class SuccessIndexState implements IndexState {
  SuccessIndexState({required this.data});
  final List<int> data;
}

class FailureIndexState implements IndexState {
  FailureIndexState({required this.errorMessage});
  final String errorMessage;
}
