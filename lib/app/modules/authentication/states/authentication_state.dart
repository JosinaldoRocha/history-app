abstract class AuthenticationState {}

class InitialAuthenticationState implements AuthenticationState {}

class LoadingAuthenticationState implements AuthenticationState {}

class Authenticated implements AuthenticationState {
  Authenticated({required this.data});
  final String data;
}

class UnAuthenticated implements AuthenticationState {
  UnAuthenticated({required this.errorMessage});
  final String errorMessage;
}
