import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/history_model.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/add-item-state/add_item_state.dart';
import '../../views/states/period_list_state/period_list_state.dart';
import '../../widgets/add_item/civil_status_list_widget.dart';
import '../../widgets/add_item/list_of_times_widget.dart';
import '../../widgets/add_item/list_what_happened_widget.dart';
import '../../widgets/add_item/relationship_list_widget.dart';
import '../../widgets/drop-down-text-field/drop_down_text_field_widget.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/input/info_text_field_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class AddItemPage extends ConsumerStatefulWidget {
  const AddItemPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddItemPageState();
}

class _AddItemPageState extends ConsumerState<AddItemPage> {
  final nameController = TextEditingController();
  final referenceController = TextEditingController();
  final relationshipController = SingleValueDropDownController();
  final civilStatusTypeController = SingleValueDropDownController();
  final whatHappenedController = SingleValueDropDownController();
  final amountTimesController = SingleValueDropDownController();
  final amountPeriodsController = SingleValueDropDownController();

  void _listen() {
    ref.listen<AddItemState>(
      addItemProvider,
      (previous, next) {
        if (next is SuccessAddItemState) {
          Navigator.pushNamed(context, '/home');
        }
        if (next is FailureAddItemState) {
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
    _listen();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: _buildContext(),
        ),
      ),
    );
  }

  Widget _buildContext() {
    return Form(
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  label: 'Nome:',
                  hintText: 'Digite o nome da garota',
                ),
                TextFieldWidget(
                  controller: referenceController,
                  label: 'Referência:',
                  hintText: 'Ex: apelido, cor, tamanho...',
                ),
                CivilStatusListWidget(controller: civilStatusTypeController),
                RelationshipListWidget(controller: relationshipController),
                ListWhatHappenedWidget(controller: whatHappenedController),
                ListOfTimesWidget(controller: amountTimesController),
                _buildPeriodList(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            title: 'Confirmar',
            onTap: () {
              final history = HistoryModel(
                name: nameController.text,
                reference: referenceController.text,
                civilStatus: civilStatusTypeController.dropDownValue!.name,
                relationship: relationshipController.dropDownValue!.name,
                whatHappened: whatHappenedController.dropDownValue!.name,
                amountTimes: amountTimesController.dropDownValue!.name,
                amountPeriod: amountPeriodsController.dropDownValue!.name,
              );
              ref.read(addItemProvider.notifier).addItem(history);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodList() {
    final state = ref.watch(periodListProvider);
    if (state is LoadingPeriodListState) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is FailurePeriodListState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: BoxText.body(state.errorMessage)),
      );
    } else if (state is SuccessPeriodListState) {
      return DropDownTextFieldWidget(
        controller: amountPeriodsController,
        list: state.data
            .map((e) => DropDownValueModel(name: e, value: e))
            .toList(),
        label: 'Em quantos perídos se relacionaram:',
        hintText: 'Selecione uma opção',
      );
    } else {
      return Container();
    }
  }
}
