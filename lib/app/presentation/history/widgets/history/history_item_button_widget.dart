import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/widgets/delete_item/alert_dialog_delete_item_widget.dart';
import 'package:my_history_app/app/presentation/history/widgets/history/history_report_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class HistoryItemButtonWidget extends ConsumerWidget {
  const HistoryItemButtonWidget({
    super.key,
    required this.index,
    required this.history,
  });
  final int index;
  final DocumentSnapshot history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: const Color.fromARGB(255, 153, 149, 149),
            ),
          ),
          child: Center(child: BoxText.bodyBold('${index + 1}')),
        ),
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 181, 214, 181),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => HistoryReportWidget(item: history),
            );
          },
          onLongPress: () {
            Navigator.pushNamed(context, '/edit-item-page', arguments: history);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxText.bodyBold(history['name']),
              BoxText.body(
                history['reference'],
                size: 14,
                color: const Color.fromARGB(255, 153, 149, 149),
              ),
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialogDeleteItemWidget(history: history),
            );
          },
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
