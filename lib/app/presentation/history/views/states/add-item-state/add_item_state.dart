abstract class AddItemState {}

class InitialAddItemState implements AddItemState {}

class LoadingAddItemState implements AddItemState {}

class SuccessAddItemState implements AddItemState {}

class FailureAddItemState implements AddItemState {
  FailureAddItemState({required this.errorMessage});
  final String errorMessage;
}
