import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/widgets/history/history_item_button_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
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
      final history = state.data;
      return history.isEmpty
          ? Center(
              child: BoxText.body('Seu histórico está vazio!'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BoxText.bodyBold(
                  'Toque para ver detalhes ou pressione para editar as informações',
                  textAlign: TextAlign.center,
                ),
                const Space.x8(),
                Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) => HistoryItemButtonWidget(
                      index: index,
                      history: history[index],
                    ),
                    separatorBuilder: (context, index) => const Space.x3(),
                    itemCount: history.length,
                  ),
                ),
                BoxText.body(
                  '${history.length}',
                  size: 12,
                ),
              ],
            );
    } else {
      return Container();
    }
  }
}
