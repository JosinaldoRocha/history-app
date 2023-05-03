import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/shared/widgets/alert_dialog/alert_dialog_loading_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../providers/history_providers.dart';
import '../../views/states/delete-item-state/delete_history_state.dart';

class AlertDialogDeleteHistoryWidget extends ConsumerWidget {
  const AlertDialogDeleteHistoryWidget({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deleteHistoryProvider);

    ref.listen<DeleteHistoryState>(
      deleteHistoryProvider,
      (previous, next) {
        if (next is SuccessDeleteHistoryState) {
          ref.read(historyListProvider.notifier).load(history.userId!);
          Navigator.pop(context);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('História excluída, com sucesso!'),
            ),
          );
        }
        if (next is FailureDeleteHistoryState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
            ),
          );
        }
      },
    );
    return (state is LoadinglDeleteHistoryState)
        ? const AlertDialogLoadingWidget()
        : AlertDialog(
            actions: [
              const Space.x2(),
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
                    onPressed: () => Navigator.pop(context),
                    child: BoxText.bodyBold('Não'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.transparent),
                    onPressed: () {
                      ref
                          .read(deleteHistoryProvider.notifier)
                          .deleteHistory(history.id!);
                    },
                    child: BoxText.bodyBold('Sim'),
                  ),
                ],
              ),
              const Space.x2(),
            ],
          );
  }
}
