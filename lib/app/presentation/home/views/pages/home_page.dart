import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/logout_state/logout_state.dart';
import 'package:my_history_app/app/presentation/home/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/home/widgets/drawer_widget.dart';
import 'package:my_history_app/app/presentation/home/widgets/home_body_widget.dart';
import 'package:my_history_app/app/presentation/home/widgets/icon_button_widget.dart';
import 'package:my_history_app/app/presentation/register/views/states/clear_register/clear_register_stete.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.args});
  final Map<String, dynamic> args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(homeProvider.notifier).load());
  }

  logoutListen() {
    ref.listen(
      logoutProvider,
      (previous, next) {
        if (next is SuccessLogoutState) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (next is FailureLogoutState) {
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

  clearRegisterListen() {
    ref.listen(
      clearRegisterProvider,
      (previous, next) {
        if (next is SuccessClearRegisterState) {
          ref.read(logoutProvider.notifier).logout();
          Navigator.pushReplacementNamed(context, '/');
        }
        if (next is FailureClearRegisterState) {
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
    final clearState = ref.watch(clearRegisterProvider);
    final user = widget.args;

    logoutListen();
    clearRegisterListen();

    return Scaffold(
      drawer: (clearState is LoadingClearRegisterState)
          ? Container(
              color: const Color.fromARGB(255, 181, 214, 181),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const DrawerWidget(),
      appBar: AppBar(
        title: BoxText.body(
          'Olá, ${user['name']}!',
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 214, 181),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: HomeBodyWidget(),
        ),
      ),
      floatingActionButton: IconButtonWidget(
        icon: Icons.exit_to_app,
        size: 45,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => _buildAlertDialog(),
          );
        },
      ),
    );
  }

  AlertDialog _buildAlertDialog() {
    return AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxText.body('Sair do aplicativo?'),
              const Space.x5(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: BoxText.body('CANCELAR'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(logoutProvider.notifier).logout();
                    },
                    child: BoxText.body('SAIR'),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
