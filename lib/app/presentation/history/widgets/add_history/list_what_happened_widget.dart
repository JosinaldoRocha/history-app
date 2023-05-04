import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/shared/widgets/dropdown_button_form_field_widget/dropdown_button_form_field_widget.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../providers/history_providers.dart';
import '../../views/states/list_what_happened_state/list_what_happened_state.dart';

class ListWhatHappenedWidget extends ConsumerWidget {
  const ListWhatHappenedWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listWhatHappenedProvider);
    if (state is LoadingListWhatHappenedState) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is FailureListWhatHappenedState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: BoxText.body(state.errorMessage)),
      );
    } else if (state is SuccessListWhatHappenedState) {
      return DropdownButtonFormFieldWidget(
        items: state.data,
        controller: controller,
        hintText: 'Selecione uma opção',
        labelText: 'O que rolou durante a relação:',
      );
      // return DropDownTextFieldWidget(
      //   controller: controller,
      //   list: state.data
      //       .map((e) => DropDownValueModel(name: e, value: e))
      //       .toList(),
      //   label: 'O que rolou durante a relação:',
      //   hintText: 'Selecione uma opção',
      // );
    } else {
      return Container();
    }
  }
}
