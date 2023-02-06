import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/texts/box_text.dart';
import '../../dependencies/dependencies.dart';
import '../../views/states/civil_status_state/civil_status_list_state.dart';
import '../drop-down-text-field/drop_down_text_field_widget.dart';

class CivilStatusListWidget extends ConsumerWidget {
  const CivilStatusListWidget({
    super.key,
    required this.controller,
  });
  final SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(civilListStatusProvider);
    if (state is LoadingCivilStatusListState) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is FailureCivilStatusListState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: BoxText.body(state.errorMessage)),
      );
    } else if (state is SuccessCivilStatusListState) {
      return DropDownTextFieldWidget(
        controller: controller,
        list: state.data
            .map((e) => DropDownValueModel(name: e, value: e))
            .toList(),
        label: 'Estado civil:',
        hintText: 'Selecione uma opção',
      );
    } else {
      return Container();
    }
  }
}
