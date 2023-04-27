import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/data/models/user_model.dart';
import '../../authentication/views/states/update_user/update_profile_picture_state.dart';
import 'alert_dialog_update_profile_picture.dart';
import 'drawer_widget.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.updateProfilePictureState,
    required this.context,
    required this.user,
  });
  final UpdateProfilePictureState updateProfilePictureState;
  final BuildContext context;
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: (updateProfilePictureState is LoadingUpdateProfilePictureState)
          ? const Padding(
              padding: EdgeInsets.all(15),
              child: CircularProgressIndicator(color: Colors.white),
            )
          : IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialogUpdateProfilePictureWidget(user: user),
                );
              },
              icon: (user.image.isEmpty)
                  ? const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                    )
                  : CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: NetworkImage(user.image),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
