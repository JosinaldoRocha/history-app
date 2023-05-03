import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../providers/history_providers.dart';
import '../../views/states/list_of_times_state/list_of_times_state.dart';
import '../../../../shared/widgets/drop-down-text-field/drop_down_text_field_widget.dart';

class ListOfTimesWidget extends ConsumerWidget {
  const ListOfTimesWidget({
    super.key,
    required this.controller,
  });
  final SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listOfTimesProvider);
    if (state is LoadingListOfTimesState) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is FailureListOfTimesState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: BoxText.body(state.errorMessage)),
      );
    } else if (state is SuccessListOfTimesState) {
      return DropDownTextFieldWidget(
        controller: controller,
        list: state.data
            .map((e) => DropDownValueModel(name: e, value: e))
            .toList(),
        label: 'Quantas vezes rolou:',
        hintText: 'Selecione uma opção',
      );
    } else {
      return Container();
    }
  }
}
