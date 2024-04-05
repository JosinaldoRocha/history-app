import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/button/button_widget.dart';
import 'package:my_history_app/app/shared/widgets/picture_widget/picture_widget.dart';
import '../../../../../shared/widgets/spacing/space_widget.dart';
import '../../../../../shared/widgets/texts/box_text.dart';

class SentEmailPage extends StatelessWidget {
  const SentEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PictureWidget.asset('assets/animations/92867-email-sent.json'),
            const Text(
              'E-mail enviado!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Space.x3(),
            BoxText.body(
              'Acesse seu e-mail e faça o processo de recuperação da sua senha por lá.',
              textAlign: TextAlign.center,
              color: const Color.fromRGBO(139, 141, 151, 1),
            ),
            const Space.x10(),
            ButtonWidget(
              title: 'Finalizar',
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
