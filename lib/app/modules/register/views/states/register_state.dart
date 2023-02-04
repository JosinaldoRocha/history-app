abstract class RegisterState {}

class InitialRegisterState implements RegisterState {}

class LoadingRegisterState implements RegisterState {}

class SuccessRegisterState implements RegisterState {}

class FailureRegisterState implements RegisterState {
  FailureRegisterState({required this.errorMessage});
  final String errorMessage;
}
