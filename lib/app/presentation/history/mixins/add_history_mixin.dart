import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/history/data/models/history_model.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../providers/history_providers.dart';
import '../views/states/add-history-state/add_history_state.dart';
import '../views/states/add_image/add_image_history_state.dart';
import '../views/states/edit_history/edit_history_state.dart';

mixin AddHistoryMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final referenceController = TextEditingController();
  var relationshipController = SingleValueDropDownController();
  var civilStatusTypeController = SingleValueDropDownController();
  var whatHappenedController = TextEditingController();
  var amountTimesController = SingleValueDropDownController();
  var amountPeriodsController = SingleValueDropDownController();
  final formKey = GlobalKey<FormState>();
  String image = '';

  void listenAddHistory() {
    ref.listen<AddHistoryState>(
      addHistoryProvider,
      (previous, next) {
        if (next is SuccessAddHistoryState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('História criada, com sucesso!'),
            ),
          );
        }
        if (next is FailureAddHistoryState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  void listenEditHistory(HistoryModel? history) {
    ref.listen<EditHistoryState>(
      editHistoryProvider,
      (previous, next) {
        if (next is SuccessEditHistoryState) {
          if (history != null) {
            ref.read(historyListProvider.notifier).load(history.userId!);
          }
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Sua história foi atualizada!'),
            ),
          );
        }
        if (next is FailureEditHistoryState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  void listenAddImage() {
    ref.listen<AddImageHistoryState>(
      addImageHistoryProvider,
      (previous, next) {
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
}
