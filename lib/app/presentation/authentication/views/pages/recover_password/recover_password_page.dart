import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/check_email/check_email_state.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/recover_password/recover_password/recover_password_state.dart';
import 'package:my_history_app/app/presentation/authentication/widgets/form_recover_password_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class RecoverPasswordPage extends ConsumerStatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends ConsumerState<RecoverPasswordPage> {
  void listen() {
    ref.listen<RecoverPasswordState>(
      recoverPasswordProvider,
      (previous, next) {
        if (next is SuccessRecoverPasswordState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Center(
                child: Text('Email enviado com sucesso'),
              ),
            ),
          );
        }

        if (next is FailureRecoverPasswordState) {
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
  Widget build(BuildContext context) {
    listen();
    return Scaffold(
      appBar: AppBar(
        title: BoxText.body(
          'Recuperar senha',
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: const Center(
          child: FormRecoverPasswordWidget(),
        ),
      ),
    );
  }
}
