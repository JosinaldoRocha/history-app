import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import '../../../authentication/data/models/user_model.dart';
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
        if (next is LoadingAddItemState) {
          showDialog(
            context: context,
            builder: (context) => Container(
              height: 200,
              width: 300,
              color: const Color.fromARGB(255, 181, 214, 181),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/logo1.png')),
                  const Space.x4(),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          );
        }
        if (next is SuccessAddItemState) {
          Navigator.pop(context);
          Navigator.pop(context);
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserModel;
    _listen();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: _buildContext(args),
        ),
      ),
    );
  }

  Widget _buildContext(UserModel user) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                TextFieldWidget(
                  controller: nameController,
                  label: 'Nome:',
                  hintText: 'Digite o nome da garota',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  controller: referenceController,
                  label: 'Referência:',
                  hintText: 'Ex: apelido, cor, tamanho...',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    }
                    return null;
                  },
                ),
                CivilStatusListWidget(controller: civilStatusTypeController),
                RelationshipListWidget(controller: relationshipController),
                ListWhatHappenedWidget(controller: whatHappenedController),
                ListOfTimesWidget(controller: amountTimesController),
                //PeriodListWidget(controller: amountPeriodsController),
                _buildPeriodList(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            title: 'Confirmar',
            onTap: () {
              final validadeForm = _formKey.currentState!.validate();
              if (validadeForm) {
                final history = HistoryModel(
                  name: nameController.text,
                  reference: referenceController.text,
                  civilStatus: civilStatusTypeController.dropDownValue!.name,
                  relationship: relationshipController.dropDownValue!.name,
                  whatHappened: whatHappenedController.dropDownValue!.name,
                  amountTimes: amountTimesController.dropDownValue!.name,
                  amountPeriod: amountPeriodsController.dropDownValue!.name,
                  //TODO alterar id
                  id: 0,
                );
                ref.read(addItemProvider.notifier).addItem(history);
              }
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
