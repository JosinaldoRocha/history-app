abstract class AuthenticationState {}

class InitialAuthenticationState implements AuthenticationState {}

class LoadingAuthenticationState implements AuthenticationState {}

class Authenticated implements AuthenticationState {}

class UnAuthenticated implements AuthenticationState {
  UnAuthenticated({required this.errorMessage});
  final String errorMessage;
}
