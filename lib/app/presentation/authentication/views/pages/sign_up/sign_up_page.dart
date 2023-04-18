import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/sign_up/sign_up_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/spacing/space_widget.dart';
import 'package:my_history_app/app/shared/widgets/validators/validators.dart';
import '../../../../../shared/widgets/input/info_text_field_widget.dart';
import '../../../data/models/user_model.dart';
import '../../../dependencies/dependencies.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

final _nameController = TextEditingController();
final _surnameController = TextEditingController();
final _userNameController = TextEditingController();
final _eMailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpPageState extends ConsumerState<SignUpPage> {
  void _signUpListen() {
    ref.listen(
      signUpProvider,
      <SignUpState>(previous, next) {
        if (next is SuccessSignUpState) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (next is FailureSignUpState) {
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

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    _signUpListen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFieldWidget(
                controller: _nameController,
                label: 'Nome:',
                hintText: 'Informe seu nome',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: _surnameController,
                label: 'Sobrenome:',
                hintText: 'Informe seu sobrenome',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: _userNameController,
                label: 'Nome de usuário:',
                hintText: 'Ex: Usuario123',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo não pode ser vazio';
                  } else if (value.length < 6) {
                    return 'O nome de usuário deve conter, pelo menos 6 dígitos';
                  }

                  return null;
                },
              ),
              TextFieldWidget(
                controller: _eMailController,
                label: 'E-mail:',
                hintText: 'Ex: seuemail@.com',
                validator: (p0) => Validators.email(_eMailController.text),
              ),
              TextFieldWidget(
                controller: _passwordController,
                label: 'Senha:',
                hintText: 'Crie uma senha para sua conta:',
                validator: (p0) =>
                    Validators.password(_passwordController.text),
              ),
              TextFieldWidget(
                controller: _confirmPasswordController,
                label: 'Confirme a senha:',
                hintText: 'Repita a senha:',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo não pode ser vazio';
                  } else if (value.length < 6) {
                    return 'Deve conter, pelo menos 6 caracteres';
                  } else if (value != _passwordController.text) {
                    return 'Senhas diferentes';
                  }
                  return null;
                },
              ),
              const Space.x5(),
              ButtonWidget(
                isLoading: signUpState is LoadingSignUpState,
                title: 'Cadastrar',
                onTap: () {
                  final validadeForm = _formKey.currentState!.validate();
                  if (validadeForm) {
                    ref.read(signUpProvider.notifier).signUp(
                          name: _nameController.text,
                          email: _eMailController.text,
                          password: _confirmPasswordController.text,
                          user: UserModel(
                            name: _nameController.text,
                            surname: _surnameController.text,
                            userName: _userNameController.text,
                            eMail: _eMailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
