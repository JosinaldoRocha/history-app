import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/history/views/states/delete-item-state/delete_item_state.dart';
import 'package:my_history_app/app/modules/history/views/states/edit_history/edit_history_state.dart';
import 'package:my_history_app/app/modules/history/widgets/history/history_list_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../register/data/models/user_model.dart';

class HistoricPage extends ConsumerStatefulWidget {
  const HistoricPage({
    required this.args,
    super.key,
  });
  final UserModel args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoricPageState();
}

class _HistoricPageState extends ConsumerState<HistoricPage> {
  void _listenAddHistory() {
    ref.listen<DeleteItemState>(
      deleteItemProvider,
      (previous, next) {
        if (next is SuccessDeleteItemState) {
          ref.read(historyProvider.notifier).load(widget.args.id);
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

  void _listenEditHistory() {
    ref.listen<EditHistoryState>(
      editHistoryProvider,
      (previous, next) {
        if (next is SuccessEditHistoryState) {
          ref.read(historyProvider.notifier).load(widget.args.id);
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
    Future.microtask(
        () => ref.read(historyProvider.notifier).load(widget.args.id));
  }

  @override
  Widget build(BuildContext context) {
    _listenAddHistory();
    _listenEditHistory();
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Hist??rico',
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 214, 181),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: HistoryListWidget(),
        ),
      ),
    );
  }
}
