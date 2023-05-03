import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import '../../authentication/dependencies/dependencies.dart';
import '../../authentication/views/states/delete_user/delete_user_state.dart';
import '../../authentication/views/states/logout_state/logout_state.dart';
import '../../authentication/views/states/update_user/update_profile_picture_state.dart';

mixin HomeMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  void logoutListen() {
    ref.listen<LogoutState>(
      logoutProvider,
      (previous, next) {
        if (next is SuccessLogoutState) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (next is FailureLogoutState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  void deleteUserListen() {
    ref.listen<DeleteUserState>(
      deleteUserProvider,
      (previous, next) {
        if (next is DeletedUserState) {
          Navigator.pushReplacementNamed(context, '/');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Conta excluída, com sucesso!'),
            ),
          );
        }
        if (next is NotDeletedUserState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  void updateProfilePictureListen(UserModel user) {
    ref.listen<UpdateProfilePictureState>(
      updataProfilePictureProvider,
      (previous, next) {
        if (next is SuccessUpdateProfilePictureState) {
          user.image = next.data.image;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Sua foto de perfil foi atualizada!'),
            ),
          );
        }
        if (next is FailureUpdateProfilePictureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }
}
