import '../../../../../register/data/models/user_model.dart';

abstract class RecoverPasswordState {}

class InitialRecoverPasswordState implements RecoverPasswordState {}

class LoadingRecoverPasswordState implements RecoverPasswordState {}

class SuccessRecoverPasswordState implements RecoverPasswordState {
  SuccessRecoverPasswordState({required this.data});
  final List<UserModel> data;
}

class FailureRecoverPasswordState implements RecoverPasswordState {
  FailureRecoverPasswordState({required this.errorMessage});
  final String errorMessage;
}
