import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/input/info_text_field_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(loginProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _buildContext(),
      ),
    );
  }

  Widget _buildContext() {
    String image = 'assets/images/h.png';
    final loginController = TextEditingController();
    final passwordController = TextEditingController();
    final loginState = ref.watch(loginProvider);

    if (loginState is LoadingLoginState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (loginState is FailureLoginState) {
      return AlertDialog(
        content: BoxText.body(loginState.errorMessage),
      );
    } else if (loginState is SuccessLoginState) {
      return Center(
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 30),
            _buildTextRow(context),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: loginController,
              label: 'Login:',
              hintText: 'digite seu e-mail:',
            ),
            TextFieldWidget(
              controller: passwordController,
              label: 'Senha:',
              hintText: 'digite sua senha:',
            ),
            ButtonWidget(
              title: 'Entrar',
              onTap: () {
                ref.read(authenticationProvider.notifier).authentication(
                    loginController.text, passwordController.text);
                Navigator.of(context).pushReplacementNamed('/splash-page');
              },
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Row _buildTextRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxText.body('Faça login ou '),
        GestureDetector(
          child: BoxText.body(
            'cadastre-se.',
            color: const Color.fromARGB(255, 3, 90, 240),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/register-page');
          },
        ),
      ],
    );
  }
}
