abstract class SignInState {}

class InitialSignInState implements SignInState {}

class LoadingSignInState implements SignInState {}

class SuccessSignInState implements SignInState {}

class FailureSignInState implements SignInState {
  FailureSignInState({required this.errorMessage});
  final String errorMessage;
}
