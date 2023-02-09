abstract class AddRegisterState {}

class InitialAddRegisterState implements AddRegisterState {}

class LoadingAddRegisterState implements AddRegisterState {}

class SuccessAddRegisterState implements AddRegisterState {}

class FailureAddRegisterState implements AddRegisterState {
  FailureAddRegisterState({required this.errorMessage});
  final String errorMessage;
}
