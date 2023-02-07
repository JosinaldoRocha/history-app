import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/views/states/list_of_times_state/list_of_times_state.dart';
import 'package:my_history_app/app/modules/history/views/states/list_what_happened_state/list_what_happened_state.dart';
import 'package:my_history_app/app/modules/history/views/states/period_list_state/period_list_state.dart';
import 'package:my_history_app/app/modules/history/views/states/relationship_list_state/relationship_list_state.dart';
import 'package:my_history_app/app/modules/history/widgets/history/edit_item_content_widget.dart';
import '../../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../data/models/history_model.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/civil_status_state/civil_status_list_state.dart';
import '../drop-down-text-field/drop_down_text_field_widget.dart';

class EditHistoryWidget extends ConsumerStatefulWidget {
  const EditHistoryWidget({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditHistoryWidgetState();
}

final nameController = TextEditingController();
final referenceController = TextEditingController();
final relationshipController = SingleValueDropDownController();
final civilStatusTypeController = SingleValueDropDownController();
final whatHappenedController = SingleValueDropDownController();
final amountTimesController = SingleValueDropDownController();
final amountPeriodsController = SingleValueDropDownController();

class _EditHistoryWidgetState extends ConsumerState<EditHistoryWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(civilListStatusProvider.notifier).load();
      ref.read(relationshipListProvider.notifier).load();
      ref.read(listWhatHappenedProvider.notifier).load();
      ref.read(listOfTimesProvider.notifier).load();
      ref.read(periodListProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final civilState = ref.watch(civilListStatusProvider);
    final relationshipState = ref.watch(relationshipListProvider);
    final whatHappenedState = ref.watch(listWhatHappenedProvider);
    final amountTimesState = ref.watch(listOfTimesProvider);
    final amountPeriodsState = ref.watch(periodListProvider);

    return Container(
      color: const Color.fromARGB(255, 202, 243, 206),
      child: Column(
        children: [
          const Space.x4(),
          BoxText.bodyBold(
            'Toque em uma opção para editá-la',
            size: 16,
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              children: [
                EditItemContentWidget(
                  title: 'Nome',
                  textField: TextFieldWidget(
                    controller: nameController,
                    label: 'Digite o novo nome:',
                    hintText: widget.history.name,
                  ),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.name = nameController.text;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'Referência',
                  textField: TextFieldWidget(
                    controller: referenceController,
                    label: 'Digite a nova referência:',
                    hintText: widget.history.reference,
                  ),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.reference = referenceController.text;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'Estado civil',
                  textField: (civilState is SuccessCivilStatusListState)
                      ? DropDownTextFieldWidget(
                          controller: civilStatusTypeController,
                          list: civilState.data
                              .map((e) => DropDownValueModel(name: e, value: e))
                              .toList(),
                          label: 'Selecione o novo estado civil:',
                          hintText: widget.history.civilStatus,
                        )
                      : Container(),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.civilStatus =
                          civilStatusTypeController.dropDownValue!.name;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'Relação que tivemos',
                  textField: (relationshipState is SuccessRelationshipListState)
                      ? DropDownTextFieldWidget(
                          controller: relationshipController,
                          list: relationshipState.data
                              .map((e) => DropDownValueModel(name: e, value: e))
                              .toList(),
                          label: 'Selecione a nova relação:',
                          hintText: widget.history.relationship,
                        )
                      : Container(),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.relationship =
                          relationshipController.dropDownValue!.name;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'O que rolou durante',
                  textField: (whatHappenedState is SuccessListWhatHappenedState)
                      ? DropDownTextFieldWidget(
                          controller: whatHappenedController,
                          list: whatHappenedState.data
                              .map((e) => DropDownValueModel(name: e, value: e))
                              .toList(),
                          label: 'Selecione o que rolou:',
                          hintText: widget.history.whatHappened,
                        )
                      : Container(),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.whatHappened =
                          whatHappenedController.dropDownValue!.name;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'Quantidade de vezes',
                  textField: (amountTimesState is SuccessListOfTimesState)
                      ? DropDownTextFieldWidget(
                          controller: amountTimesController,
                          list: amountTimesState.data
                              .map((e) => DropDownValueModel(name: e, value: e))
                              .toList(),
                          label: 'Selecione a nova quantidade:',
                          hintText: widget.history.amountTimes,
                        )
                      : Container(),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.amountTimes =
                          amountTimesController.dropDownValue!.name;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
                EditItemContentWidget(
                  title: 'Quantidade de períodos',
                  textField: (amountPeriodsState is SuccessPeriodListState)
                      ? DropDownTextFieldWidget(
                          controller: amountPeriodsController,
                          list: amountPeriodsState.data
                              .map((e) => DropDownValueModel(name: e, value: e))
                              .toList(),
                          label: 'Selecione a nova quantidade:',
                          hintText: widget.history.amountPeriod,
                        )
                      : Container(),
                  widgetFunction: _buildEditItemButton(
                    'Salvar',
                    () {
                      widget.history.amountPeriod =
                          amountPeriodsController.dropDownValue!.name;
                      ref
                          .read(editHistoryProvider.notifier)
                          .editHistory(widget.history);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: BoxText.body(
                'Finalizar',
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const Space.x2(),
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
