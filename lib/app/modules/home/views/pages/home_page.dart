import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/authentication/views/states/logout_state/logout_state.dart';
import 'package:my_history_app/app/modules/home/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/home/widgets/drawer_widget.dart';
import 'package:my_history_app/app/modules/home/widgets/home_body_widget.dart';
import 'package:my_history_app/app/modules/home/widgets/icon_button_widget.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/views/states/clear_register/clear_register_stete.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

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
    final args = ModalRoute.of(context)?.settings.arguments as UserModel;

    final clearState = ref.watch(clearRegisterProvider);
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
          'Olá, ${args.name}!',
          color: Colors.white,
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 214, 181),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: HomeBodyWidget(user: args),
        ),
      ),
      floatingActionButton: IconButtonWidget(
        icon: Icons.exit_to_app,
        size: 45,
        onTap: () {
          ref.read(logoutProvider.notifier).logout();
        },
      ),
    );
  }
}
