import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/login/views/states/login_state.dart';
import 'package:my_history_app/app/modules/login/widgets/text_fild_login_widget.dart';
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

  _showPassword() {
    if (_obscureText) {
      _obscureText = false;
    } else {
      _obscureText = true;
    }
    setState(() {
      _obscureText;
    });
  }

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  String image = 'assets/images/logo.png';
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);

    if (loginState is LoadingLoginState) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (loginState is FailureLoginState) {
      return AlertDialog(
        content: BoxText.body(loginState.errorMessage),
      );
    } else if (loginState is SuccessLoginState) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 100),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(image),
                    ),
                    BoxText.bodyBold(
                      'Login',
                      size: 35,
                    ),
                    const Space.x7(),
                    TextFieldLoginWidget(
                      label: 'Usuário:',
                      controller: _userNameController,
                      items: loginState.data,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo não pode ser vazio';
                        } else if (!loginState.data.any((element) =>
                            element.userName == _userNameController.text)) {
                          return 'Usuário não cadastrado';
                        }
                        return null;
                      },
                    ),
                    const Space.x4(),
                    TextFieldLoginWidget(
                      label: 'Senha:',
                      obscureText: _obscureText,
                      controller: _passwordController,
                      items: loginState.data,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _showPassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Este campo não pode ser vazio';
                        } else if (!loginState.data.any((element) =>
                            element.userName == _userNameController.text &&
                            element.password == _passwordController.text)) {
                          return 'Senha inválida';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/recover-password');
                          },
                          child: BoxText.body(
                            'Esqueceu a senha?',
                            color: const Color.fromARGB(255, 3, 90, 240),
                          ),
                        ),
                      ],
                    ),
                    const Space.x6(),
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
                    _buildTextRow(),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Row _buildTextRow() {
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
