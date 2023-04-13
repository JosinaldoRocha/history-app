abstract class DeleteItemState {}

class InitialDeleteItemState implements DeleteItemState {}

class LoadinglDeleteItemState implements DeleteItemState {}

class SuccessDeleteItemState implements DeleteItemState {}

class FailureDeleteItemState implements DeleteItemState {
  FailureDeleteItemState({required this.errorMessage});
  final String errorMessage;
}
