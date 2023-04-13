import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';

class AlertDialogDeleteItemWidget extends ConsumerWidget {
  const AlertDialogDeleteItemWidget({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actions: [
        Center(
          child: BoxText.body('Excluir ${history.name} do histórico?'),
        ),
        const Space.x4(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () {
                ref.read(deleteItemProvider.notifier).deleteItem(history);
                Navigator.pop(context);
              },
              child: BoxText.bodyBold('Sim'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () => Navigator.pop(context),
              child: BoxText.bodyBold('Não'),
            ),
          ],
        )
      ],
    );
  }
}
