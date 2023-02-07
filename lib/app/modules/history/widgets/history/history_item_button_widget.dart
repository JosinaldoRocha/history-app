import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/widgets/history/edit_history_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/history/history_report_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';

class HistoryItemButtonWidget extends ConsumerWidget {
  const HistoryItemButtonWidget({
    super.key,
    required this.index,
    required this.history,
  });
  final int index;
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 60, 114, 78),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: BoxText.body(
            '${index + 1}',
            color: Colors.white,
          ),
        ),
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 60, 114, 78),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => HistoryReportWidget(item: history),
            );
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => EditHistoryWidget(history: history),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxText.body(
                history.name,
                color: Colors.white,
                size: 18,
              ),
              BoxText.body(
                history.reference,
                color: const Color.fromARGB(255, 177, 172, 172),
              ),
            ],
          ),
        ),
        trailing: CircleAvatar(
          child: IconButton(
            onPressed: () {
              ref.read(deleteItemProvider.notifier).deleteItem(history);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
