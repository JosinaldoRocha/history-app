import 'package:flutter/material.dart';

class AlertDialogLoadingWidget extends StatelessWidget {
  const AlertDialogLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      shadowColor: Colors.white,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Carregando...',
                style: TextStyle(fontSize: 16),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ],
    );
  }
}
