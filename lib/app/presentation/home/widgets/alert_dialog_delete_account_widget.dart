import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/providers/authentication_providers.dart';

class AlertDialogDeleteAccounttWidget extends ConsumerWidget {
  const AlertDialogDeleteAccounttWidget({
    required this.user,
    super.key,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxText.body(
                'Excluir conta com todos os seus dados?',
                textAlign: TextAlign.center,
              ),
              const Space.x5(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('CANCELAR'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      ref
                          .read(deleteUserProvider.notifier)
                          .deleteUser(user.id!);
                      Navigator.pop(context);
                    },
                    child: const Text('SIM'),
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
