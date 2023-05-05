import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';
import '../../../../../shared/widgets/spacing/space_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 20,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              const Space.x3(),
              BoxText.bodyBold('Histórico'),
              const Space.x5(),
              BoxText.body(
                'O histórico é um aplicativo desenvolvido para usuários que '
                'gostam de registrar suas histórias amorosas. '
                '\nNo histórico você pode armazenar infinitas histórias diferentes, '
                'podendo descrever nome, referência, tipos de relacionamento, '
                'quantidade de perídos e vezes em que se relacionou com uma determinada '
                'pessoa, etc. \nTodos os seus dados serão salvos em nuvem evitando que '
                'você não os perca, caso seu aparelho seja roubado, perdido ou formatado. '
                'Espero que tenha uma experiência incrível com nosso aplicativo.',
                textAlign: TextAlign.center,
                size: 15,
              ),
              const Spacer(),
              BoxText.body(
                '© Copyright',
                size: 12,
              ),
              const Spacer(),
              const Text(
                'Desenvolvido por: Josinaldo Rocha Leal',
              ),
              const Space.x2(),
              const Text(
                'Versão do aplicativo: 1.0.0+1',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
