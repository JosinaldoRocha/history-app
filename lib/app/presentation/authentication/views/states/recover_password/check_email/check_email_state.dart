import '../../../../data/models/user_model.dart';

abstract class CheckEmailState {}

class InitialCheckEmailState implements CheckEmailState {}

class LoadingCheckEmailState implements CheckEmailState {}

class SuccessCheckEmailState implements CheckEmailState {
  SuccessCheckEmailState({required this.data});
  final UserModel data;
}

class FailureCheckEmailState implements CheckEmailState {
  FailureCheckEmailState({required this.errorMessage});
  final String errorMessage;
}
