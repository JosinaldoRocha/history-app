import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/shared/widgets/alert_dialog_loading_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/delete-item-state/delete_item_state.dart';

class AlertDialogDeleteItemWidget extends ConsumerWidget {
  const AlertDialogDeleteItemWidget({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deleteItemProvider);

    ref.listen<DeleteItemState>(
      deleteItemProvider,
      (previous, next) {
        if (next is SuccessDeleteItemState) {
          ref.read(historyProvider.notifier).load(history.userId);
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (next is FailureDeleteItemState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
            ),
          );
        }
      },
    );
    return (state is LoadinglDeleteItemState)
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
                          .read(deleteItemProvider.notifier)
                          .deleteItem(history.id);
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
