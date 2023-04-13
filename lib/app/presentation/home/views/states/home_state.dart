import 'package:my_history_app/app/presentation/register/data/models/user_model.dart';

abstract class HomeState {}

class InitialHomeState implements HomeState {}

class LoadingHomeState implements HomeState {}

class SuccessHomeState implements HomeState {
  SuccessHomeState({required this.data});
  final List<UserModel> data;
}

class FailureHomeState implements HomeState {
  FailureHomeState({required this.errorMessage});
  final String errorMessage;
}
