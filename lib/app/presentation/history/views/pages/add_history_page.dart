import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_history_app/app/presentation/history/views/states/add_image/add_image_history_state.dart';
import 'package:my_history_app/app/presentation/history/views/states/edit_history/edit_history_state.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import '../../data/models/history_model.dart';
import '../../dependencies/dependencies.dart';
import '../../widgets/add_item/period_list_widget.dart';
import '../states/add-history-state/add_history_state.dart';
import '../../widgets/add_item/civil_status_list_widget.dart';
import '../../widgets/add_item/list_of_times_widget.dart';
import '../../widgets/add_item/list_what_happened_widget.dart';
import '../../widgets/add_item/relationship_list_widget.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/input/info_text_field_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class AddHistoryPage extends ConsumerStatefulWidget {
  const AddHistoryPage({
    super.key,
    required this.args,
  });
  final HistoryModel? args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends ConsumerState<AddHistoryPage> {
  final nameController = TextEditingController();
  final referenceController = TextEditingController();
  var relationshipController = SingleValueDropDownController();
  var civilStatusTypeController = SingleValueDropDownController();
  var whatHappenedController = SingleValueDropDownController();
  var amountTimesController = SingleValueDropDownController();
  var amountPeriodsController = SingleValueDropDownController();
  String image = '';

  void _listenAddHistory() {
    ref.listen<AddHistoryState>(
      addHistoryProvider,
      (previous, next) {
        if (next is SuccessAddHistoryState) {
          Navigator.pop(context);
        }
        if (next is FailureAddHistoryState) {
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

  void _listenEditHistory() {
    ref.listen<EditHistoryState>(
      editHistoryProvider,
      (previous, next) {
        if (next is SuccessEditHistoryState) {
          ref.read(historyProvider.notifier).load(widget.args!.userId!);
          Navigator.pop(context);
        }
        if (next is FailureEditHistoryState) {
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

  void _listenAddImage() {
    ref.listen<AddImageHistoryState>(
      addImageProvider,
      (previous, next) {
        if (next is SuccessAddImageHistoryState) {}
        if (next is FailureAddImageHistoryState) {
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

    if (widget.args != null) {
      final history = widget.args!;
      final relationship = SingleValueDropDownController(
          data: DropDownValueModel(
              name: history.relationship, value: history.relationship));
      final civilStatus = SingleValueDropDownController(
          data: DropDownValueModel(
              name: history.civilStatus, value: history.civilStatus));
      final whatHappened = SingleValueDropDownController(
          data: DropDownValueModel(
              name: history.whatHappened, value: history.whatHappened));
      final amountTimes = SingleValueDropDownController(
          data: DropDownValueModel(
              name: history.amountTimes, value: history.amountTimes));
      final amountPeriods = SingleValueDropDownController(
          data: DropDownValueModel(
              name: history.amountPeriod, value: history.amountPeriod));

      nameController.text = history.name;
      referenceController.text = history.reference;
      relationshipController = relationship;
      civilStatusTypeController = civilStatus;
      whatHappenedController = whatHappened;
      amountTimesController = amountTimes;
      amountPeriodsController = amountPeriods;
      image = history.image;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addHistoryState = ref.watch(addHistoryProvider);
    final editHistoryState = ref.watch(editHistoryProvider);
    final addImageState = ref.watch(addImageProvider);
    _listenAddHistory();
    _listenEditHistory();
    _listenAddImage();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: _buildContext(
            addHistoryState,
            editHistoryState,
            addImageState,
          ),
        ),
      ),
    );
  }

  Widget _buildContext(
    AddHistoryState addHistoryState,
    EditHistoryState editHistoryState,
    AddImageHistoryState addImageState,
  ) {
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
                PeriodListWidget(controller: amountPeriodsController),
                const Space.x3(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxText.bodyBold('Adicionar foto'),
                    const SizedBox(width: 20),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 212, 210, 210),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            ref
                                .read(addImageProvider.notifier)
                                .addImage(pickedFile.path);
                          }
                        },
                        icon: (addImageState is LoadingAddImageHistoryState)
                            ? const Padding(
                                padding: EdgeInsets.all(2),
                                child: CircularProgressIndicator(),
                              )
                            : (addImageState is SuccessAddImageHistoryState)
                                ? const Icon(Icons.check_rounded)
                                : const Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ],
                ),
                const Space.x3(),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            title: 'Confirmar',
            isLoading: addHistoryState is LoadingAddHistoryState ||
                editHistoryState is LoadingEditHistoryState,
            onTap: () {
              final validadeForm = _formKey.currentState!.validate();
              if (validadeForm) {
                if (widget.args != null) {
                  if (addImageState is SuccessAddImageHistoryState) {
                    image = addImageState.data;
                  }
                  final history = HistoryModel(
                    name: nameController.text,
                    reference: referenceController.text,
                    civilStatus: civilStatusTypeController.dropDownValue!.name,
                    relationship: relationshipController.dropDownValue!.name,
                    whatHappened: whatHappenedController.dropDownValue!.name,
                    amountTimes: amountTimesController.dropDownValue!.name,
                    amountPeriod: amountPeriodsController.dropDownValue!.name,
                    id: widget.args!.id,
                    userId: widget.args!.userId,
                    image: image,
                  );
                  ref.read(editHistoryProvider.notifier).editHistory(history);
                } else {
                  if (addImageState is SuccessAddImageHistoryState) {
                    image = addImageState.data;
                  }
                  final history = HistoryModel(
                    name: nameController.text,
                    reference: referenceController.text,
                    civilStatus: civilStatusTypeController.dropDownValue!.name,
                    relationship: relationshipController.dropDownValue!.name,
                    whatHappened: whatHappenedController.dropDownValue!.name,
                    amountTimes: amountTimesController.dropDownValue!.name,
                    amountPeriod: amountPeriodsController.dropDownValue!.name,
                    image: image,
                  );
                  ref.read(addHistoryProvider.notifier).addHistory(history);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
