import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/data/models/user_model.dart';
import '../../authentication/views/states/update_user/update_profile_picture_state.dart';
import 'alert_dialog_update_profile_picture.dart';
import 'drawer_widget.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({
    super.key,
    required this.updateProfilePictureState,
    required this.user,
  });
  final UpdateProfilePictureState updateProfilePictureState;
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      leading: (updateProfilePictureState is LoadingUpdateProfilePictureState)
          ? const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            )
          : IconButton(
              iconSize: 60,
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
      title: BoxText.bodyBold('Olá, ${user.name}!'),
      trailing: IconButton(
        iconSize: 40,
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
        icon: const Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
