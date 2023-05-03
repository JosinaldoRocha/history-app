abstract class DeleteUserState {}

class InitialDeleteUserState implements DeleteUserState {}

class LoadingDeleteUserState implements DeleteUserState {}

class DeletedUserState implements DeleteUserState {}

class NotDeletedUserState implements DeleteUserState {
  NotDeletedUserState({required this.errorMessage});
  final String errorMessage;
}
