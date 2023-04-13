import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import '../../../shared/widgets/button/button_widget.dart';
import '../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../shared/widgets/spacing/space_widget.dart';
import '../../../shared/widgets/texts/box_text.dart';
import '../dependencies/dependencies.dart';

class FormRecoverPasswordWidget extends ConsumerWidget {
  const FormRecoverPasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = TextEditingController();
    final emailController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final state = ref.watch(recoverPasswordProvider);

    if (state is LoadingRecoverPasswordState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is FailureRecoverPasswordState) {
      return Center(
        child: BoxText.body(state.errorMessage),
      );
    } else if (state is SuccessRecoverPasswordState) {
      return Form(
        key: formKey,
        child: Column(
          children: [
            BoxText.body(
                'Informe seu nome de usuário e e-mail para recuperação de senha'),
            const Space.x10(),
            TextFieldWidget(
              controller: userController,
              label: 'Usuário',
              hintText: '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo não pode ser vazio';
                } else if (!state.data.any(
                    (element) => element.userName == userController.text)) {
                  return 'Esse nome de usuário não existe';
                }
                return null;
              },
            ),
            TextFieldWidget(
              controller: emailController,
              label: 'E-mail',
              hintText: '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo não pode ser vazio';
                } else if (!state.data
                    .any((element) => element.eMail == emailController.text)) {
                  return 'Esse e-mail não existe';
                } else {
                  if (!state.data.any((element) =>
                      element.eMail == emailController.text &&
                      element.userName == userController.text)) {
                    return 'E-mail não compatível com o usuário informado';
                  }
                }

                return null;
              },
            ),
            const Space.x4(),
            ButtonWidget(
              title: 'Verificar',
              onTap: () {
                final validator = formKey.currentState!.validate();
                if (validator) {
                  final email = emailController.text;
                  ref.read(checkEmailProvider.notifier).recoverPassword(email);
                }
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
