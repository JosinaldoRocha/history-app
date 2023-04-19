import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class HistoryReportWidget extends StatelessWidget {
  const HistoryReportWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final QueryDocumentSnapshot item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 202, 243, 206),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoxText.bodyBold(
                'Detalhes da minha relação com\n${item['name']}',
                textAlign: TextAlign.start,
                size: 17,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              )
            ],
          ),
          const Space.x3(),
          Flexible(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                children: [
                  BoxText.bodyBold('Nome:'),
                  BoxText.body(item['name']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Referência:'),
                  BoxText.body(item['reference']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Estado civil:'),
                  BoxText.body(item['civil-status']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Relação que tivemos:'),
                  BoxText.body(item['relationship']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('O que rolou:'),
                  BoxText.body(item['what-happened']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Quantas vezes:'),
                  BoxText.body(item['amount-times']),
                  const Divider(height: 5, thickness: 1),
                  BoxText.bodyBold('Em quantos períodos:'),
                  BoxText.body(item['amount-period']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
