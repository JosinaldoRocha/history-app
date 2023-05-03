import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/providers/authentication_providers.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_in_state/sign_in_state.dart';
import 'package:my_history_app/app/presentation/authentication/widgets/text_fild_login_widget.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import 'package:my_history_app/app/shared/widgets/validators/validators.dart';
import '../../../widgets/eye_password_widget.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  void _signInlisten() {
    ref.listen<SignInState>(
      signInProvider,
      (previous, next) {
        if (next is SuccessSignInState) {
          Navigator.of(context).pushReplacementNamed('/');
        }
        if (next is FailureSignInState) {
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

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    final authentication = ref.watch(signInProvider);
    _signInlisten();

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
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                  const Space.x4(),
                  BoxText.bodyBold(
                    'Login',
                    size: 25,
                  ),
                  const Space.x7(),
                  TextFieldLoginWidget(
                    label: 'E-mail:',
                    controller: _emailController,
                    validator: (p0) => Validators.email(_emailController.text),
                  ),
                  const Space.x5(),
                  TextFieldLoginWidget(
                    label: 'Senha:',
                    obscureText: visibility,
                    controller: _passwordController,
                    suffixIcon: EyePasswordWidget(
                      onChanged: () => setState(() => visibility = !visibility),
                      isObscure: visibility,
                    ),
                    validator: (p0) =>
                        Validators.password(_passwordController.text),
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
                    isLoading: authentication is LoadingSignInState,
                    title: 'Entrar',
                    onTap: () {
                      final validadeForm = formKey.currentState?.validate();
                      if (validadeForm!) {
                        ref.read(signInProvider.notifier).signIn(
                              _emailController.text,
                              _passwordController.text,
                            );
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
            Navigator.pushNamed(context, '/sign-up');
          },
        ),
      ],
    );
  }
}
