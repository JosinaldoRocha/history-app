abstract class SignUpState {}

class InitialSignUpState implements SignUpState {}

class LoadingSignUpState implements SignUpState {}

class SuccessSignUpState implements SignUpState {
  SuccessSignUpState({this.data});
  final String? data;
}

class FailureSignUpState implements SignUpState {
  FailureSignUpState({required this.errorMessage});
  final String errorMessage;
}
