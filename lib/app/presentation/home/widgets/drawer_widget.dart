import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/home/widgets/alert_dialog_logout_widget.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const ListTile(
          leading: Text('Sobre'),
          trailing: Icon(Icons.info),
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
