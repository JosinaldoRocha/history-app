import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/logout_state/logout_state.dart';
import 'package:my_history_app/app/presentation/home/widgets/home_body_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../authentication/views/states/update_user/update_profile_picture_state.dart';
import '../../widgets/app_bar_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.args});
  final UserModel args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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

  void updateProfilePictureListen() {
    ref.listen<UpdateProfilePictureState>(
      updataProfilePictureProvider,
      (previous, next) {
        if (next is SuccessUpdateProfilePictureState) {
          widget.args.image = next.data.image;
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

  @override
  Widget build(BuildContext context) {
    final user = widget.args;
    final updateProfilePictureState = ref.watch(updataProfilePictureProvider);

    logoutListen();
    updateProfilePictureListen();
    deleteUserListen();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/book.jpg'),
            fit: BoxFit.cover,
            opacity: 1.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 10,
          ),
          child: Column(
            children: [
              AppBarWidget(
                updateProfilePictureState: updateProfilePictureState,
                user: user,
              ),
              const Spacer(),
              HomeBodyWidget(user: user),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
