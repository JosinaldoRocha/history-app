import '../../../data/models/user_model.dart';

abstract class UpdateProfilePictureState {}

class InitialUpdateProfilePictureState implements UpdateProfilePictureState {}

class LoadingUpdateProfilePictureState implements UpdateProfilePictureState {}

class SuccessUpdateProfilePictureState implements UpdateProfilePictureState {
  SuccessUpdateProfilePictureState({required this.data});
  final UserModel data;
}

class FailureUpdateProfilePictureState implements UpdateProfilePictureState {
  FailureUpdateProfilePictureState({required this.errorMessage});
  final String errorMessage;
}
