import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/widgets/history/edit_history_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/history/history_report_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';

class HistoryItemButtonWidget extends ConsumerStatefulWidget {
  const HistoryItemButtonWidget({
    super.key,
    required this.index,
    required this.history,
  });
  final int index;
  final HistoryModel history;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HistoryItemButtonWidgetState();
}

class _HistoryItemButtonWidgetState
    extends ConsumerState<HistoryItemButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(38, 108, 58, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: BoxText.body(
            '${widget.history.id}',
            //'${widget.index + 1}',
            color: Colors.white,
          ),
        ),
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(38, 108, 58, 1),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => HistoryReportWidget(item: widget.history),
            );
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) =>
                  EditHistoryWidget(index: widget.index, item: widget.history),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxText.body(
                widget.history.name,
                color: Colors.white,
              ),
              BoxText.body(
                widget.history.reference,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        trailing: CircleAvatar(
          child: IconButton(
            onPressed: () {
              ref.read(deleteItemProvider.notifier).deleteItem(widget.history);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
