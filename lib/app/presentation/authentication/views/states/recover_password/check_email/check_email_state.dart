abstract class CheckEmailState {}

class InitialCheckEmailState implements CheckEmailState {}

class LoadingCheckEmailState implements CheckEmailState {}

class SuccessCheckEmailState implements CheckEmailState {}

class FailureCheckEmailState implements CheckEmailState {
  FailureCheckEmailState({required this.errorMessage});
  final String errorMessage;
}
