abstract class AddUserState {}

class InitialAddUserState implements AddUserState {}

class LoadingAddUserState implements AddUserState {}

class SuccessAddUserState implements AddUserState {
  SuccessAddUserState({this.data});
  final String? data;
}

class FailureAddUserState implements AddUserState {
  FailureAddUserState({required this.errorMessage});
  final String errorMessage;
}
