import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/logout_state/logout_state.dart';
import 'package:my_history_app/app/presentation/home/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/home/views/states/home_state.dart';
import 'package:my_history_app/app/presentation/home/widgets/drawer_widget.dart';
import 'package:my_history_app/app/presentation/home/widgets/home_body_widget.dart';
import 'package:my_history_app/app/shared/widgets/alert_dialog/alert_dialog_loading_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../../authentication/views/states/update_user/update_profile_picture_state.dart';

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
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
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
        // if (next is SuccessUpdateProfilePictureState) {
        //   ref.read(homeProvider.notifier).load();
        // }
        if (next is FailureUpdateProfilePictureState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(homeProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.args;
    final updateProfilePictureState = ref.watch(updataProfilePictureProvider);
    final homeState = ref.watch(homeProvider);

    logoutListen();
    updateProfilePictureListen();
    if (homeState is LoadingHomeState) {
      return const AlertDialogLoadingWidget();
    }
    if (homeState is SuccessHomeState) {
      return Scaffold(
        appBar: AppBar(
          leading: (updateProfilePictureState
                  is LoadingUpdateProfilePictureState)
              ? const CircleAvatar(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : IconButton(
                  onPressed: () async {
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    ref
                        .read(updataProfilePictureProvider.notifier)
                        .load(user, pickedFile!.path);
                  },
                  icon: (homeState.data.image.isEmpty)
                      ? const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(homeState.data.image),
                        ),
                ),
          title: BoxText.body(
            'Olá, ${user.name}!',
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const DrawerWidget(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu_rounded),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: Container(
          color: const Color.fromARGB(255, 181, 214, 181),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: HomeBodyWidget(user: user),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
