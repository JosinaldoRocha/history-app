import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/authentication/views/states/recover_password/check_email/check_email_state.dart';
import 'package:my_history_app/app/modules/authentication/widgets/form_recover_password_widget.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class RecoverPasswordPage extends ConsumerStatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends ConsumerState<RecoverPasswordPage> {
  _checkEmailListen() {
    ref.listen(
      checkEmailProvider,
      (previous, next) {
        if (next is LoadingCheckEmailState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (next is SuccessCheckEmailState) {
          showDialog(
            context: context,
            builder: (context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxText.body(
                      '${next.data.name}, essa é sua senha de login',
                      textAlign: TextAlign.center,
                    ),
                    const Space.x4(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                          child: BoxText.body('Senha: ${next.data.password}')),
                    ),
                    const Space.x10(),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: ButtonWidget(
                width: 200,
                title: 'Fazer Login',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ),
          );
        }
        if (next is FailureCheckEmailState) {
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
    Future.microtask(() => ref.read(recoverPasswordProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    _checkEmailListen();
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
