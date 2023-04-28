import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import 'package:my_history_app/app/shared/widgets/validators/validators.dart';
import '../../../shared/widgets/button/button_widget.dart';
import '../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../dependencies/dependencies.dart';

class FormRecoverPasswordWidget extends ConsumerWidget {
  const FormRecoverPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final state = ref.watch(recoverPasswordProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          BoxText.body('Informe seu e-mail'),
          const Space.x8(),
          TextFieldWidget(
            controller: emailController,
            label: 'E-mail',
            hintText: '',
            validator: (p0) => Validators.email(emailController.text),
          ),
          const Spacer(),
          ButtonWidget(
            isLoading: state is LoadingRecoverPasswordState,
            title: 'Verificar',
            onTap: () {
              if (formKey.currentState!.validate()) {
                ref
                    .read(recoverPasswordProvider.notifier)
                    .resetPassword(emailController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
