import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/history/widgets/delete_item/alert_dialog_delete_item_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class HistoryReportWidget extends ConsumerWidget {
  const HistoryReportWidget({
    Key? key,
    required this.history,
  }) : super(key: key);
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxText.bodyBold(
                'Minha história com ${history.name}',
                textAlign: TextAlign.start,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialogDeleteItemWidget(history: history),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          const Space.x1(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                children: [
                  Center(
                    child: (history.image.isEmpty)
                        ? const Icon(
                            Icons.person,
                            size: 40,
                          )
                        : _buildGestureDetector(context),
                  ),
                  const Space.x3(),
                  BoxText.bodyBold('Nome:'),
                  BoxText.body(history.name),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Referência:'),
                  BoxText.body(history.reference),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Estado civil:'),
                  BoxText.body(history.civilStatus),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Relação que tivemos:'),
                  BoxText.body(history.relationship),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('O que rolou:'),
                  BoxText.body(history.whatHappened),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Quantas vezes:'),
                  BoxText.body(history.amountTimes),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Em quantos períodos:'),
                  BoxText.body(history.amountPeriod),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildGestureDetector(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(history.image),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              Image.network(history.image),
            ],
          ),
        );
      },
    );
  }
}
