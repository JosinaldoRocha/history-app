abstract class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class SuccessLoginState implements LoginState {}

class FailureLoginState implements LoginState {
  FailureLoginState({required this.errorMessage});
  final String errorMessage;
}
