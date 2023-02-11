import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/register/views/states/add_register/add_register_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import '../../../../shared/widgets/input/info_text_field_widget.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

final fullNameController = TextEditingController();
final userNameController = TextEditingController();
final eMailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final idController = TextEditingController();
final _formKey = GlobalKey<FormState>();

_clearTexts() {
  fullNameController.clear();
  userNameController.clear();
  eMailController.clear();
  passwordController.clear();
  confirmPasswordController.clear();
  idController.clear();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(addRegisterProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addRegisterProvider);
    double id = double.parse(idController.text);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body: (addState is LoadingAddRegisterState)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFieldWidget(
                        controller: fullNameController,
                        label: 'Nome completo:',
                        hintText: 'Ex: Nome Sobrenome',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          }
                          return null;
                        },
                      ),
                      TextFieldWidget(
                        controller: userNameController,
                        label: 'Nome de usuário:',
                        hintText: 'Ex: Usuario123',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          } else if (value.length < 8) {
                            return 'Deve conter, pelo menos 8 caracteres';
                          }
                          return null;
                        },
                      ),
                      TextFieldWidget(
                        controller: eMailController,
                        label: 'E-mail:',
                        hintText: 'Ex: seuemail@.com',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          } else if (value.length < 11) {
                            return 'Deve conter, pelo menos 11 caracteres';
                          } else if (!value.contains('@')) {
                            return 'Formato de e-mail inválido';
                          }
                          return null;
                        },
                      ),
                      TextFieldWidget(
                        controller: passwordController,
                        label: 'Senha:',
                        hintText: 'Crie uma senha para sua conta:',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          } else if (value.length < 6) {
                            return 'Deve conter, pelo menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      TextFieldWidget(
                        controller: confirmPasswordController,
                        label: 'Confirme\na senha:',
                        hintText: 'Repita a senha:',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Este campo não pode ser vazio';
                          } else if (value.length < 6) {
                            return 'Deve conter, pelo menos 6 caracteres';
                          } else if (value != passwordController.text) {
                            return 'Senhas diferentes';
                          }
                          return null;
                        },
                      ),
                      if (addState is SuccessAddRegisterState)
                        TextFieldWidget(
                          controller: idController,
                          label: 'Id de usuário:',
                          hintText: 'Ex: 1',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo não pode ser vazio';
                            }
                            if (addState.data
                                .any((element) => element.id == id)) {
                              return 'Id existente. Tente um id diferente';
                            }

                            return null;
                          },
                        ),
                      ButtonWidget(
                        title: 'Cadastrar',
                        onTap: () {
                          final validadeForm =
                              _formKey.currentState!.validate();
                          if (validadeForm) {
                            UserModel item = UserModel(
                              fullName: fullNameController.text,
                              userName: userNameController.text,
                              eMail: eMailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              id: id,
                            );
                            _clearTexts();
                            ref
                                .read(addRegisterProvider.notifier)
                                .addRegister(item);
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
