abstract class ClearRegisterState {}

class InitialClearRegisterState implements ClearRegisterState {}

class LoadingClearRegisterState implements ClearRegisterState {}

class SuccessClearRegisterState implements ClearRegisterState {}

class FailureClearRegisterState implements ClearRegisterState {
  FailureClearRegisterState({required this.errorMessage});
  final String errorMessage;
}
