import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
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

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    label: BoxText.body('Usuário:'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 148, 146, 146),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 148, 146, 146),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (p0) {
                    _userNameController.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    } else if (value.length < 8) {
                      return 'Quantidade de caracteres insuficiente';
                    }
                    if (!loginState.data.any((element) =>
                        element.userName == _userNameController.text)) {
                      return 'Usuário não cadastrado';
                    }
                    return null;
                  },
                ),
                const Space.x4(),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    label: BoxText.body('Senha:'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 148, 146, 146),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 148, 146, 146),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {},
                    ),
                  ),
                  onChanged: (p0) {
                    _passwordController.text;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo não pode ser vazio';
                    } else if (value.length < 6) {
                      return 'Sua senha deve contar, pelo menos 6 dígitos';
                    }
                    if (!loginState.data.any((element) =>
                        element.userName == _userNameController.text &&
                        element.password == _passwordController.text)) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                ),
                const Space.x8(),
                ButtonWidget(
                  title: 'Entrar',
                  onTap: () {
                    final validadeForm = formKey.currentState?.validate();
                    if (validadeForm!) {
                      ref
                          .read(authenticationProvider.notifier)
                          .loginVirification(
                            _userNameController.text,
                            _passwordController.text,
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
