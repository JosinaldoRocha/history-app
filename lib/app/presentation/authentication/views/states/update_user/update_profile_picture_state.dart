abstract class UpdateProfilePictureState {}

class InitialUpdateProfilePictureState implements UpdateProfilePictureState {}

class LoadingUpdateProfilePictureState implements UpdateProfilePictureState {}

class SuccessUpdateProfilePictureState implements UpdateProfilePictureState {}

class FailureUpdateProfilePictureState implements UpdateProfilePictureState {
  FailureUpdateProfilePictureState({required this.errorMessage});
  final String errorMessage;
}
