import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import 'package:my_history_app/app/presentation/history/widgets/history/history_report_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class HistoryItemButtonWidget extends ConsumerWidget {
  const HistoryItemButtonWidget({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(26, 146, 141, 141),
      ),
      padding: const EdgeInsets.only(
        left: 10,
        top: 3,
        bottom: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (history.image.isEmpty)
              ? const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                )
              : CircleAvatar(backgroundImage: NetworkImage(history.image)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => HistoryReportWidget(history: history),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              );
            },
            child: Column(
              children: [
                BoxText.bodyBold(history.name),
                BoxText.body(
                  history.reference,
                  size: 14,
                  color: const Color.fromARGB(255, 153, 149, 149),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/add-history-page',
                arguments: history,
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
