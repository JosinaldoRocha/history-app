import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/history/data/models/history_model.dart';
import 'package:my_history_app/app/modules/history/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/history/views/states/add-item-state/add_item_state.dart';
import 'package:my_history_app/app/modules/history/views/states/add_index_state/add_index_state.dart';
import 'package:my_history_app/app/modules/history/views/states/civil_status_state/civil_status_list_state.dart';
import 'package:my_history_app/app/modules/history/views/states/list_of_times_state/list_of_times_state.dart';
import 'package:my_history_app/app/modules/history/views/states/list_what_happened_state/list_what_happened_state.dart';
import 'package:my_history_app/app/modules/history/views/states/period_list_state/period_list_state.dart';
import 'package:my_history_app/app/modules/history/views/states/relationship_list_state/relationship_list_state.dart';
import 'package:my_history_app/app/modules/history/widgets/add_item/civil_status_list_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/add_item/list_of_times_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/add_item/list_what_happened_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/add_item/relationship_list_widget.dart';
import 'package:my_history_app/app/modules/history/widgets/drop-down-text-field/drop_down_text_field_widget.dart';
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

  void _listenInt() {
    ref.listen<AddIndexState>(
      addIndexProvider,
      (previous, next) {
        if (next is SuccessAddIndexState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body('Funcionou'),
            ),
          );
        }
        if (next is FailureAddIndexState) {
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
      //ref.read(indexProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    _listenInt();
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
    // final indexState = ref.watch(indexProvider);
    // if (indexState is SuccessIndexState) {
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
                IconButton(
                  onPressed: () {
                    // if (indexState.data.isEmpty) {
                    //   ref.read(addIndexProvider.notifier).addIndex(0);
                    // } else {
                    //   ref
                    //       .read(addIndexProvider.notifier)
                    //       .addIndex(indexState.data.length);
                    // }
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            title: 'Confirmar',
            onTap: () {
              final item = HistoryModel(
                name: nameController.text,
                reference: referenceController.text,
                civilStatus: civilStatusTypeController.dropDownValue!.name,
                relationship: relationshipController.dropDownValue!.name,
                whatHappened: whatHappenedController.dropDownValue!.name,
                amountTimes: amountTimesController.dropDownValue!.name,
                amountPeriod: amountPeriodsController.dropDownValue!.name,
                //id: indexState.data.length,
              );
              ref.read(addItemProvider.notifier).addItem(1, item);
            },
          ),
        ],
      ),
    );
    // } else {
    //   return Container();
    // }
  }

  // Widget _buildCivilStatusList() {
  //   final state = ref.watch(civilListStatusProvider);
  //   if (state is LoadingCivilStatusListState) {
  //     return const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Center(child: CircularProgressIndicator()),
  //     );
  //   } else if (state is FailureCivilStatusListState) {
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Center(child: BoxText.body(state.errorMessage)),
  //     );
  //   } else if (state is SuccessCivilStatusListState) {
  //     return DropDownTextFieldWidget(
  //       controller: civilStatusTypeController,
  //       list: state.data
  //           .map((e) => DropDownValueModel(name: e, value: e))
  //           .toList(),
  //       label: 'Estado civil:',
  //       hintText: 'Selecione uma opção',
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // Widget _buildRelationshipList() {
  //   final state = ref.watch(relationshipListProvider);
  //   if (state is LoadingRelationshipListState) {
  //     return const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Center(child: CircularProgressIndicator()),
  //     );
  //   } else if (state is FailureRelationshipListState) {
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Center(child: BoxText.body(state.errorMessage)),
  //     );
  //   } else if (state is SuccessRelationshipListState) {
  //     return DropDownTextFieldWidget(
  //       controller: relationshipController,
  //       list: state.data
  //           .map((e) => DropDownValueModel(name: e, value: e))
  //           .toList(),
  //       label: 'Tipo de relação:',
  //       hintText: 'Selecione uma opção',
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // Widget _buildListWhatHappened() {
  //   final state = ref.watch(listWhatHappenedProvider);
  //   if (state is LoadingListWhatHappenedState) {
  //     return const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Center(child: CircularProgressIndicator()),
  //     );
  //   } else if (state is FailureListWhatHappenedState) {
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Center(child: BoxText.body(state.errorMessage)),
  //     );
  //   } else if (state is SuccessListWhatHappenedState) {
  //     return DropDownTextFieldWidget(
  //       controller: whatHappenedController,
  //       list: state.data
  //           .map((e) => DropDownValueModel(name: e, value: e))
  //           .toList(),
  //       label: 'O que rolou durante a relação:',
  //       hintText: 'Selecione uma opção',
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

  // Widget _buildListOfTimes() {
  //   final state = ref.watch(listOfTimesProvider);
  //   if (state is LoadingListOfTimesState) {
  //     return const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Center(child: CircularProgressIndicator()),
  //     );
  //   } else if (state is FailureListOfTimesState) {
  //     return Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Center(child: BoxText.body(state.errorMessage)),
  //     );
  //   } else if (state is SuccessListOfTimesState) {
  //     return DropDownTextFieldWidget(
  //       controller: amountTimesController,
  //       list: state.data
  //           .map((e) => DropDownValueModel(name: e, value: e))
  //           .toList(),
  //       label: 'Quantas vezes rolou:',
  //       hintText: 'Selecione uma opção',
  //     );
  //   } else {
  //     return Container();
  //   }
  // }

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
