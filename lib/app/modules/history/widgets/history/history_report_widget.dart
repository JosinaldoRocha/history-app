import 'package:flutter/material.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class HistoryReportWidget extends StatelessWidget {
  const HistoryReportWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final HistoryModel item;

  @override
  Widget build(BuildContext context) {
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
