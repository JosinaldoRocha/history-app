import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../../authentication/providers/authentication_providers.dart';

class AlertDialogLogoutWidget extends ConsumerWidget {
  const AlertDialogLogoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: const Text('CANCELAR'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(logoutProvider.notifier).logout();
                    },
                    child: const Text('SAIR'),
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
