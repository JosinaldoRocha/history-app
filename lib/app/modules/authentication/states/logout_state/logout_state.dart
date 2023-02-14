abstract class LogoutState {}

class InitialLogoutState implements LogoutState {}

class LoadingLogoutState implements LogoutState {}

class SuccessLogoutState implements LogoutState {}

class FailureLogoutState implements LogoutState {
  FailureLogoutState({required this.errorMessage});
  final String errorMessage;
}
