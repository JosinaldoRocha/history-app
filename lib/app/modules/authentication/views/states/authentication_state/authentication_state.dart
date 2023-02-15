import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

abstract class AuthenticationState {}

class InitialAuthenticationState implements AuthenticationState {}

class LoadingAuthenticationState implements AuthenticationState {}

class Authenticated implements AuthenticationState {
  Authenticated({required this.data});
  final UserModel data;
}

class UnAuthenticated implements AuthenticationState {
  UnAuthenticated({required this.errorMessage});
  final String errorMessage;
}
