import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/dependencies/dependencies.dart';

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
              builder: (context) => _buildAlertDialog(ref, context),
            );
          },
        ),
      ],
    );
  }

  AlertDialog _buildAlertDialog(WidgetRef ref, BuildContext context) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxText.body('Sair do aplicativo?'),
              const Space.x5(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: BoxText.body('CANCELAR'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(logoutProvider.notifier).logout();
                    },
                    child: BoxText.body('SAIR'),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
