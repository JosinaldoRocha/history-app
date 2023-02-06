abstract class AddIndexState {}

class InitialAddIndexState implements AddIndexState {}

class LoadingAddIndexState implements AddIndexState {}

class SuccessAddIndexState implements AddIndexState {}

class FailureAddIndexState implements AddIndexState {
  FailureAddIndexState({required this.errorMessage});
  final String errorMessage;
}
