import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/widgets/history/history_item_button_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/history-list-state/history_state.dart';

class HistoryListWidget extends ConsumerStatefulWidget {
  const HistoryListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HistoryListWidgetState();
}

class _HistoryListWidgetState extends ConsumerState<HistoryListWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(historyProvider);

    if (state is LoadingHistoryState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is FailureHistoryState) {
      return AlertDialog(
        content: BoxText.body(state.errorMessage),
      );
    } else if (state is SuccessHistoryState) {
      return state.data.isEmpty
          ? const Center(
              child: Text('Lista vazia!'),
            )
          : Column(
              children: [
                Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) => HistoryItemButtonWidget(
                        index: index, history: state.data[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
    } else {
      return Container();
    }
  }
}
