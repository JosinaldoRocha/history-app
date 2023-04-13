import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';

abstract class AddUserState {}

class InitialAddUserState implements AddUserState {}

class LoadingAddUserState implements AddUserState {}

class SuccessAddUserState implements AddUserState {
  SuccessAddUserState({required this.data});
  final List<UserModel> data;
}

class FailureAddUserState implements AddUserState {
  FailureAddUserState({required this.errorMessage});
  final String errorMessage;
}
