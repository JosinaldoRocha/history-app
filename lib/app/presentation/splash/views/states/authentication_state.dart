abstract class AuthenticationState {}

class InitialAuthenticationState implements AuthenticationState {}

class LoadingAuthenticationState implements AuthenticationState {}

class Authenticated implements AuthenticationState {
  Authenticated({required this.data});
  final Map<String, dynamic> data;
}

class UnAuthenticated implements AuthenticationState {
  UnAuthenticated({this.errorMessage});
  final String? errorMessage;
}
