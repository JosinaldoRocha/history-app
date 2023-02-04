import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/register_model.dart';
import 'package:my_history_app/app/modules/register/dependencies/dependencies.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';

import '../../../../shared/widgets/input/info_text_field_widget.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

final nameController = TextEditingController();
final ageController = TextEditingController();
final eMailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Informe o valor';
                  //   }
                  //   return null;
                  // },
                  controller: nameController,
                  label: 'Nome:',
                  hintText: 'nome de usuário:',
                ),
                TextFieldWidget(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  label: 'idade:',
                  hintText: 'Digite sua idade:',
                ),
                TextFieldWidget(
                  controller: eMailController,
                  label: 'E-mail:',
                  hintText: 'digite seu e-mail:',
                ),
                TextFieldWidget(
                  controller: passwordController,
                  label: 'Senha:',
                  hintText: 'digite sua senha:',
                ),
                TextFieldWidget(
                  controller: confirmPasswordController,
                  label: 'Confirme\na senha',
                  hintText: 'confirme a senha:',
                ),
                ButtonWidget(
                  title: 'Cadastrar',
                  onTap: () {
                    double age = double.tryParse(ageController.text) ?? 0;
                    final item = UserModel(
                      name: nameController.text,
                      age: age,
                      eMail: eMailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    );
                    // if (_formKey.currentState!.validate()) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Processing Data')),
                    //   );
                    // }
                    ref.read(registerProvider.notifier).addRegister(item);
                    Navigator.pushNamed(context, '/');
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
