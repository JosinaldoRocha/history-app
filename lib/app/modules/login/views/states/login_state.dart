import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

abstract class LoginState {}

class InitialLoginState implements LoginState {}

class LoadingLoginState implements LoginState {}

class SuccessLoginState implements LoginState {
  SuccessLoginState({required this.data});
  final List<UserModel> data;
}

class FailureLoginState implements LoginState {
  FailureLoginState({required this.errorMessage});
  final String errorMessage;
}
