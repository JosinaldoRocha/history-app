import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/history/views/states/delete-item-state/delete_item_state.dart';
import 'package:my_history_app/app/modules/history/views/states/history-list-state/history_state.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';

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

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(historyProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Histórico!',
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: _buildContext(),
      ),
    );
  }

  Widget _buildContext() {
    final historyState = ref.watch(historyProvider);

    if (historyState is LoadingHistoryState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (historyState is FailureHistoryState) {
      return AlertDialog(
        content: BoxText.body(historyState.errorMessage),
      );
    } else if (historyState is SuccessHistoryState) {
      return historyState.data.isEmpty
          ? const Center(
              child: Text('Lista vazia!'),
            )
          : Column(
              children: [
                Flexible(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        _buildItemButton(index, historyState.data),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: historyState.data.length,
                  ),
                ),
              ],
            );
    } else {
      return Container();
    }
  }

  Container _buildItemButton(int index, List<HistoryModel> item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(38, 108, 58, 1),
        borderRadius: BorderRadius.circular(5),
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
            backgroundColor: const Color.fromRGBO(38, 108, 58, 1),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => _buildItemDetails(item[index]),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BoxText.body(
                item[index].name,
                color: Colors.white,
              ),
              BoxText.body(
                item[index].reference,
                color: Colors.white,
              ),
            ],
          ),
        ),
        trailing: CircleAvatar(
          child: IconButton(
            onPressed: () {
              ref.read(deleteItemProvider.notifier).deleteItem(item[index]);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }

  Widget _buildItemDetails(HistoryModel item) {
    return Container(
      color: const Color.fromARGB(255, 202, 243, 206),
      child: Column(
        children: [
          const Space.x4(),
          BoxText.bodyBold('Detalhes da minha relação com ${item.name}'),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                BoxText.bodyBold('Nome:'),
                BoxText.body(item.name),
                const Space.x1(),
                BoxText.bodyBold('Referência:'),
                BoxText.body(item.reference),
                const Space.x1(),
                BoxText.bodyBold('Estado civil:'),
                BoxText.body(item.civilStatus),
                const Space.x1(),
                BoxText.bodyBold('Relação que tivemos:'),
                BoxText.body(item.relationship),
                const Space.x1(),
                BoxText.bodyBold('O que rolou:'),
                BoxText.body(item.whatHappened),
                const Space.x1(),
                BoxText.bodyBold('Quantas vezes:'),
                BoxText.body(item.amountTimes),
                const Space.x1(),
                BoxText.bodyBold('Em quantos períodos:'),
                BoxText.body(item.amountPeriod),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
