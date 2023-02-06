import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/history/views/states/delete-item-state/delete_item_state.dart';
import 'package:my_history_app/app/modules/history/views/states/edit_history/edit_history_state.dart';
import 'package:my_history_app/app/modules/history/widgets/history/history_list_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HistoricPage extends ConsumerStatefulWidget {
  const HistoricPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoricPageState();
}

class _HistoricPageState extends ConsumerState<HistoricPage> {
  void _listen() {
    ref.listen<DeleteItemState>(
      deleteItemProvider,
      (previous, next) {
        if (next is SuccessDeleteItemState) {
          ref.read(historyProvider.notifier).load();
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
  }

  void _listenEdit() {
    ref.listen<EditHistoryState>(
      editHistoryProvider,
      (previous, next) {
        if (next is SuccessEditHistoryState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body('Ta dando certo'),
            ),
          );
        }

        if (next is FailureEditHistoryState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(historyProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    _listenEdit();
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Histórico!',
          color: Colors.white,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(30),
        child: HistoryListWidget(),
      ),
    );
  }
}
