abstract class CivilStatusListState {}

class InitialCivilStatusListState implements CivilStatusListState {}

class LoadingCivilStatusListState implements CivilStatusListState {}

class SuccessCivilStatusListState implements CivilStatusListState {
  SuccessCivilStatusListState({required this.data});
  final List<String> data;
}

class FailureCivilStatusListState implements CivilStatusListState {
  FailureCivilStatusListState({required this.errorMessage});
  final String errorMessage;
}
