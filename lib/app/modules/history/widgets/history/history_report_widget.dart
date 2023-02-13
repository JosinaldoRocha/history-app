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
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 202, 243, 206),
      child: Column(
        children: [
          const Space.x2(),
          BoxText.bodyBold(
            'Detalhes da minha relação com\n${item.name}',
            textAlign: TextAlign.center,
            size: 17,
          ),
          const Space.x3(),
          Flexible(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  BoxText.bodyBold('Nome:'),
                  BoxText.body(item.name),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Referência:'),
                  BoxText.body(item.reference),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Estado civil:'),
                  BoxText.body(item.civilStatus),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Relação que tivemos:'),
                  BoxText.body(item.relationship),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('O que rolou:'),
                  BoxText.body(item.whatHappened),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Quantas vezes:'),
                  BoxText.body(item.amountTimes),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Em quantos períodos:'),
                  BoxText.body(item.amountPeriod),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
