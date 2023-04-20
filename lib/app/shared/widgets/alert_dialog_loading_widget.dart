import 'package:flutter/material.dart';

class AlertDialogLoadingWidget extends StatelessWidget {
  const AlertDialogLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('carregando...'),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
