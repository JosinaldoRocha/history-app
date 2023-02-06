import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../data/models/history_model.dart';
import '../../dependencies/dependencies.dart';

class EditHistoryWidget extends ConsumerWidget {
  const EditHistoryWidget({
    super.key,
    required this.index,
    required this.item,
  });
  final int index;
  final HistoryModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();

    return Container(
      color: const Color.fromARGB(255, 202, 243, 206),
      child: Column(
        children: [
          const Space.x6(),
          BoxText.bodyBold('Toque para alterar'),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                _buildEditItemButton(
                  'Nome',
                  () async {
                    await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextFieldWidget(
                            controller: nameController,
                            label: 'Digite o novo nome:',
                            hintText: item.name,
                          ),
                          const Space.x2(),
                          Center(
                            child: _buildEditItemButton(
                              'Salvar',
                              () {
                                item.name = nameController.text;
                                final history = HistoryModel(
                                  name: item.name,
                                  reference: item.reference,
                                  civilStatus: item.civilStatus,
                                  relationship: item.relationship,
                                  whatHappened: item.whatHappened,
                                  amountTimes: item.amountTimes,
                                  amountPeriod: item.amountPeriod,
                                  id: item.key,
                                );
                                ref
                                    .read(editHistoryProvider.notifier)
                                    .editHistory(index, history);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                    ref.read(historyProvider.notifier).load();
                  },
                ),
                _buildEditItemButton(
                  'Referência',
                  () {},
                ),
                _buildEditItemButton(
                  'Estado civil',
                  () {},
                ),
                _buildEditItemButton(
                  'Relação que tivemos',
                  () {},
                ),
                _buildEditItemButton(
                  'O que rolou',
                  () {},
                ),
                _buildEditItemButton(
                  'Quantidade de vezes',
                  () {},
                ),
                _buildEditItemButton(
                  'Quantidade de períodos',
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditItemButton(String title, Function() onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(38, 108, 58, 1),
      ),
      onPressed: onPressed,
      child: BoxText.body(
        title,
        color: Colors.white,
      ),
    );
  }
}
