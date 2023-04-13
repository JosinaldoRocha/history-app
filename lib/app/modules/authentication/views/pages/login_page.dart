import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/authentication/views/states/login_state/login_state.dart';
import 'package:my_history_app/app/modules/authentication/widgets/text_fild_login_widget.dart';
import 'package:my_history_app/app/modules/splash/views/states/authentication_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../splash/providers/authentication_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  void _listen() {
    ref.listen<AuthenticationState>(
      authenticationProvider,
      (previous, next) {
        if (next is Authenticated) {
          Navigator.of(context).pushReplacementNamed('/');
        }
        if (next is UnAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(next.errorMessage),
            ),
          );
        }
      },
    );
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String image = 'assets/images/logo.png';
  final formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(authenticationProvider);
    _listen();

    // if (loginState is LoadingLoginState) {
    //   return Container(
    //     color: Colors.white,
    //     child: const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // } else if (loginState is FailureLoginState) {
    //   return AlertDialog(
    //     content: BoxText.body(loginState.errorMessage),
    //   );
    // if (loginState is SuccessLoginState) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                    size: 30,
                  ),
                  const Space.x7(),
                  TextFieldLoginWidget(
                    label: 'E-mail:',
                    controller: _emailController,
                    //items: loginState.data,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo não pode ser vazio';
                        // } else if (!loginState.data.any((element) =>
                        //     element.userName == _emailController.text)) {
                        //   return 'E-mail não cadastrado';
                      }
                      return null;
                    },
                  ),
                  const Space.x5(),
                  TextFieldLoginWidget(
                    label: 'Senha:',
                    obscureText: _obscureText,
                    controller: _passwordController,
                    //items: loginState.data,
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
                        // } else if (!loginState.data.any((element) =>
                        //     element.userName == _emailController.text &&
                        //     element.password == _passwordController.text)) {
                        //   return 'Senha inválida';
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
                  const Space.x4(),
                  ButtonWidget(
                    isLoading: authentication is LoadingAuthenticationState,
                    title: 'Entrar',
                    onTap: () {
                      final validadeForm = formKey.currentState?.validate();
                      if (validadeForm!) {
                        ref.read(authenticationProvider.notifier).signIn(
                              _emailController.text,
                              _passwordController.text,
                            );
                        // Navigator.of(context).pushReplacementNamed('/');
                      }
                    },
                  ),
                  const Space.x4(),
                  _buildTextRow(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // } else {
    //   return Container();
    // }
  }

  Row _buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoxText.body('Não possui uma conta?'),
        TextButton(
          child: BoxText.body(
            'Cadastre-se!',
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
