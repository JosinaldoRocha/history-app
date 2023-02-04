abstract class HomeState {}

class InitialHomeState implements HomeState {}

class LoadingHomeState implements HomeState {}

class SuccessHomeState implements HomeState {}

class FailureHomeState implements HomeState {
  FailureHomeState({required this.errorMessage});
  final String errorMessage;
}
