import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/views/states/list_of_times_state/list_of_times_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/list_what_happened_state/list_what_happened_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/period_list_state/period_list_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/relationship_list_state/relationship_list_state.dart';
import 'package:my_history_app/app/presentation/history/widgets/history/edit_item_content_widget.dart';
import '../../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../../shared/widgets/spacing/space_widget.dart';
import '../../data/models/history_model.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/civil_status_state/civil_status_list_state.dart';
import '../../widgets/drop-down-text-field/drop_down_text_field_widget.dart';

class EditItemPage extends ConsumerStatefulWidget {
  const EditItemPage({
    super.key,
    required this.history,
  });
  final HistoryModel history;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditItemPageState();
}

final _nameController = TextEditingController();
final _referenceController = TextEditingController();
final relationshipController = SingleValueDropDownController();
final _civilStatusTypeController = SingleValueDropDownController();
final _whatHappenedController = SingleValueDropDownController();
final _amountTimesController = SingleValueDropDownController();
final _amountPeriodsController = SingleValueDropDownController();

class _EditItemPageState extends ConsumerState<EditItemPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref.read(civilListStatusProvider.notifier).load();
        ref.read(relationshipListProvider.notifier).load();
        ref.read(listWhatHappenedProvider.notifier).load();
        ref.read(listOfTimesProvider.notifier).load();
        ref.read(periodListProvider.notifier).load();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final civilState = ref.watch(civilListStatusProvider);
    final relationshipState = ref.watch(relationshipListProvider);
    final whatHappenedState = ref.watch(listWhatHappenedProvider);
    final amountTimesState = ref.watch(listOfTimesProvider);
    final amountPeriodsState = ref.watch(periodListProvider);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        title: BoxText.bodyBold('Toque em uma opção para editá-la'),
        backgroundColor: const Color.fromARGB(255, 202, 243, 206),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 202, 243, 206),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: ListView(
          children: [
            EditItemContentWidget(
              title: 'Nome',
              textField: TextFieldWidget(
                controller: _nameController,
                label: 'Nome:',
                hintText: widget.history.name,
              ),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.name = _nameController.text;
                  ref
                      .read(editHistoryProvider.notifier)
                      .editHistory(widget.history);
                  Navigator.pop(context);
                },
              ),
            ),
            const Space.x3(),
            EditItemContentWidget(
              title: 'Referência',
              textField: TextFieldWidget(
                controller: _referenceController,
                label: 'Referência:',
                hintText: widget.history.reference,
              ),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.reference = _referenceController.text;
                  ref
                      .read(editHistoryProvider.notifier)
                      .editHistory(widget.history);
                  Navigator.pop(context);
                },
              ),
            ),
            const Space.x3(),
            EditItemContentWidget(
              title: 'Estado civil',
              textField: (civilState is SuccessCivilStatusListState)
                  ? DropDownTextFieldWidget(
                      controller: _civilStatusTypeController,
                      list: civilState.data
                          .map((e) => DropDownValueModel(name: e, value: e))
                          .toList(),
                      label: 'Estado civil:',
                      hintText: widget.history.civilStatus,
                    )
                  : Container(),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.civilStatus =
                      _civilStatusTypeController.dropDownValue!.name;
                  ref
                      .read(editHistoryProvider.notifier)
                      .editHistory(widget.history);
                  Navigator.pop(context);
                },
              ),
            ),
            const Space.x3(),
            EditItemContentWidget(
              title: 'Relação que tivemos',
              textField: (relationshipState is SuccessRelationshipListState)
                  ? DropDownTextFieldWidget(
                      controller: relationshipController,
                      list: relationshipState.data
                          .map((e) => DropDownValueModel(name: e, value: e))
                          .toList(),
                      label: 'Relação que tivemos:',
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
            const Space.x3(),
            EditItemContentWidget(
              title: 'O que rolou durante',
              textField: (whatHappenedState is SuccessListWhatHappenedState)
                  ? DropDownTextFieldWidget(
                      controller: _whatHappenedController,
                      list: whatHappenedState.data
                          .map((e) => DropDownValueModel(name: e, value: e))
                          .toList(),
                      label: 'O que rolou durante:',
                      hintText: widget.history.whatHappened,
                    )
                  : Container(),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.whatHappened =
                      _whatHappenedController.dropDownValue!.name;
                  ref
                      .read(editHistoryProvider.notifier)
                      .editHistory(widget.history);
                  Navigator.pop(context);
                },
              ),
            ),
            const Space.x3(),
            EditItemContentWidget(
              title: 'Quantidade de vezes',
              textField: (amountTimesState is SuccessListOfTimesState)
                  ? DropDownTextFieldWidget(
                      controller: _amountTimesController,
                      list: amountTimesState.data
                          .map((e) => DropDownValueModel(name: e, value: e))
                          .toList(),
                      label: 'Quantidade de vezes:',
                      hintText: widget.history.amountTimes,
                    )
                  : Container(),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.amountTimes =
                      _amountTimesController.dropDownValue!.name;
                  ref
                      .read(editHistoryProvider.notifier)
                      .editHistory(widget.history);
                  Navigator.pop(context);
                },
              ),
            ),
            const Space.x3(),
            EditItemContentWidget(
              title: 'Quantidade de períodos',
              textField: (amountPeriodsState is SuccessPeriodListState)
                  ? DropDownTextFieldWidget(
                      controller: _amountPeriodsController,
                      list: amountPeriodsState.data
                          .map((e) => DropDownValueModel(name: e, value: e))
                          .toList(),
                      label: 'Quantidade de períodos:',
                      hintText: widget.history.amountPeriod,
                    )
                  : Container(),
              widgetFunction: _buildEditItemButton(
                'Salvar',
                () {
                  widget.history.amountPeriod =
                      _amountPeriodsController.dropDownValue!.name;
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
