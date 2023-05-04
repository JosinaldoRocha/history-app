import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/providers/authentication_providers.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/delete_user/delete_user_state.dart';
import 'package:my_history_app/app/presentation/home/widgets/alert_dialog_delete_account_widget.dart';
import 'package:my_history_app/app/presentation/home/widgets/alert_dialog_logout_widget.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/data/models/user_model.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({
    required this.user,
    super.key,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deleteUserProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Space.x2(),
        ListTile(
          leading: const Text('Home'),
          trailing: const Icon(Icons.home),
          onTap: () => Navigator.pop(context),
        ),
        const Divider(),
        ListTile(
          leading: const Text('Sobre'),
          trailing: const Icon(Icons.info),
          onTap: () {
            Navigator.pushNamed(context, '/about-page');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Text('Excluir conta'),
          trailing: (state is LoadingDeleteUserState)
              ? const CircularProgressIndicator()
              : const Icon(Icons.delete),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialogDeleteAccounttWidget(user: user),
            );
          },
        ),
        const Divider(),
        const Spacer(),
        ListTile(
          leading: BoxText.body('Sair'),
          trailing: const Icon(Icons.exit_to_app),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AlertDialogLogoutWidget(),
            );
          },
        ),
      ],
    );
  }
}
