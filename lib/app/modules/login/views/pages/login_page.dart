import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/register/views/pages/register_page.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/input/info_text_field_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
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
        padding: const EdgeInsets.all(30),
        child: _buildContext(),
      ),
    );
  }

  Widget _buildContext() {
    String image = 'assets/images/logo.png';
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    final loginState = ref.watch(loginProvider);
    final formKey = GlobalKey<FormState>();

    if (loginState is LoadingLoginState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (loginState is FailureLoginState) {
      return AlertDialog(
        content: BoxText.body(loginState.errorMessage),
      );
    } else if (loginState is SuccessLoginState) {
      return Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Space.x10(),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(image),
                ),
                BoxText.bodyBold(
                  'Login',
                  size: 35,
                ),
                const Space.x7(),
                TextFieldWidget(
                  controller: userNameController,
                  label: 'Nome de usuário:',
                  hintText: 'Ex: Usuario123',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    } else if (value.length < 11) {
                      return 'Quantidade de caracteres insuficiente';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  controller: passwordController,
                  label: 'Senha:',
                  hintText: 'Digite a senha:',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    } else if (value.length < 6) {
                      return 'Quantidade de caracteres insuficiente';
                    }
                    return null;
                  },
                ),
                const Space.x2(),
                ButtonWidget(
                  title: 'Entrar',
                  onTap: () {
                    final validadeForm = formKey.currentState?.validate();
                    if (validadeForm!) {
                      ref
                          .read(authenticationProvider.notifier)
                          .loginVirification(
                            userNameController.text,
                            passwordController.text,
                          );
                      Navigator.of(context).pushReplacementNamed('/');
                    }
                  },
                ),
                _buildTextRow(context),
              ],
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
        BoxText.body('Não possui uma conta?'),
        TextButton(
          child: BoxText.body(
            'cadastre-se!',
            color: const Color.fromARGB(255, 3, 90, 240),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/register-page');
          },
        ),
      ],
    );
  }
}
