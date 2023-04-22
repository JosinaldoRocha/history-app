import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/presentation/authentication/data/models/user_model.dart';
import 'package:my_history_app/app/presentation/authentication/dependencies/dependencies.dart';
import 'package:my_history_app/app/presentation/authentication/views/states/logout_state/logout_state.dart';
import 'package:my_history_app/app/presentation/home/widgets/drawer_widget.dart';
import 'package:my_history_app/app/presentation/home/widgets/home_body_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.args});
  final UserModel args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  logoutListen() {
    ref.listen(
      logoutProvider,
      (previous, next) {
        if (next is SuccessLogoutState) {
          Navigator.pushReplacementNamed(context, '/');
        }
        if (next is FailureLogoutState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BoxText.body(next.errorMessage),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.args;

    logoutListen();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            // ou: final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
            if (pickedFile != null) {
              // faça algo com o arquivo de imagem selecionado
              final image = File(pickedFile.path);
              Image.file(image);
            }
          },
          icon: const Icon(Icons.person),
        ),
        title: BoxText.body(
          'Olá, ${user.name}!',
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const DrawerWidget(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.menu_rounded),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 181, 214, 181),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: HomeBodyWidget(user: widget.args),
        ),
      ),
    );
  }
}
