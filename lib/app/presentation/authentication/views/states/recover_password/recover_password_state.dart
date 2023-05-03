abstract class RecoverPasswordState {}

class InitialRecoverPasswordState implements RecoverPasswordState {}

class LoadingRecoverPasswordState implements RecoverPasswordState {}

class SuccessRecoverPasswordState implements RecoverPasswordState {}

class FailureRecoverPasswordState implements RecoverPasswordState {
  FailureRecoverPasswordState({required this.errorMessage});
  final String errorMessage;
}
