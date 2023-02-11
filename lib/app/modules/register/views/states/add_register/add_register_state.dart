import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

abstract class AddRegisterState {}

class InitialAddRegisterState implements AddRegisterState {}

class LoadingAddRegisterState implements AddRegisterState {}

class SuccessAddRegisterState implements AddRegisterState {
  SuccessAddRegisterState({required this.data});
  final List<UserModel> data;
}

class FailureAddRegisterState implements AddRegisterState {
  FailureAddRegisterState({required this.errorMessage});
  final String errorMessage;
}
