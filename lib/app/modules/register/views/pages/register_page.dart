import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';
import 'package:my_history_app/app/modules/register/dependencies/dependencies.dart';
import 'package:my_history_app/app/modules/register/views/states/add_user/add_user_state.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../../shared/widgets/input/info_text_field_widget.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

final _nameController = TextEditingController();
final _surnameController = TextEditingController();
final _userNameController = TextEditingController();
final _eMailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
final _idController = TextEditingController();
final _formKey = GlobalKey<FormState>();

_clearTexts() {
  _nameController.clear();
  _surnameController.clear();
  _userNameController.clear();
  _eMailController.clear();
  _passwordController.clear();
  _confirmPasswordController.clear();
  _idController.clear();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(addUserProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final addState = ref.watch(addUserProvider);

    if (addState is LoadingAddUserState) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (addState is FailureAddUserState) {
      return Center(
        child: BoxText.body(addState.errorMessage),
      );
    } else if (addState is SuccessAddUserState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastre-se'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
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
                      } else if (addState.data.any((element) =>
                          element.userName == _userNameController.text)) {
                        return 'Usuário existente. Tente um nome de usuário diferente';
                      }

                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: _eMailController,
                    label: 'E-mail:',
                    hintText: 'Ex: seuemail@.com',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo não pode ser vazio';
                      } else if (value.length < 11) {
                        return 'O e-mail conter, pelo menos 11 dígitos';
                      } else if (!value.contains('@')) {
                        return 'Formato de e-mail inválido';
                      } else if (addState.data.any((element) =>
                          element.eMail == _eMailController.text)) {
                        return 'Endereço de e-mail existente';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: _passwordController,
                    label: 'Senha:',
                    hintText: 'Crie uma senha para sua conta:',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo não pode ser vazio';
                      } else if (value.length < 8) {
                        return 'Sua senha deve conter, pelo menos 8 caracteres';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    controller: _confirmPasswordController,
                    label: 'Confirme\na senha:',
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
                  TextFieldWidget(
                    controller: _idController,
                    label: 'Id de usuário:',
                    hintText: 'Ex: 1',
                    onTap: (p0) {
                      _idController.text;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo não pode ser vazio';
                      }
                      int id = int.parse(_idController.text);
                      if (addState.data.any((element) => element.id == id)) {
                        return 'Id existente. Tente um id diferente';
                      }

                      return null;
                    },
                  ),
                  ButtonWidget(
                    title: 'Cadastrar',
                    onTap: () {
                      final validadeForm = _formKey.currentState!.validate();
                      if (validadeForm) {
                        int id = int.parse(_idController.text);
                        UserModel item = UserModel(
                          name: _nameController.text,
                          surname: _surnameController.text,
                          userName: _userNameController.text,
                          eMail: _eMailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                          id: id,
                        );
                        _clearTexts();
                        ref.read(addUserProvider.notifier).addUser(item);
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
    } else {
      return Container();
    }
  }
}
