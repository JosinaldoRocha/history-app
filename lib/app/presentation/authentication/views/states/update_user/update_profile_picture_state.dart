import '../../../data/models/user_model.dart';

abstract class UpdateProfilePictureState {}

class InitialUpdateProfilePictureState implements UpdateProfilePictureState {}

class LoadingUpdateProfilePictureState implements UpdateProfilePictureState {}

class SuccessUpdateProfilePictureState implements UpdateProfilePictureState {
  final UserModel data;
  SuccessUpdateProfilePictureState({required this.data});
}

class FailureUpdateProfilePictureState implements UpdateProfilePictureState {
  FailureUpdateProfilePictureState({required this.errorMessage});
  final String errorMessage;
}
