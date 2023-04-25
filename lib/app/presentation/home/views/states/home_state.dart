import '../../../authentication/data/models/user_model.dart';

abstract class HomeState {}

class InitialHomeState implements HomeState {}

class LoadingHomeState implements HomeState {}

class SuccessHomeState implements HomeState {
  SuccessHomeState({required this.data});
  final UserModel data;
}

class FailureHomeState implements HomeState {
  FailureHomeState({required this.errorMessage});
  final String errorMessage;
}
