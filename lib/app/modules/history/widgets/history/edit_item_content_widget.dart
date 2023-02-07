import 'package:flutter/material.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class EditItemContentWidget extends StatelessWidget {
  const EditItemContentWidget({
    Key? key,
    required this.title,
    required this.textField,
    required this.widgetFunction,
  }) : super(key: key);

  final String title;
  final Widget textField;
  final Widget widgetFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(38, 108, 58, 1),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              textField,
              Center(
                child: widgetFunction,
              ),
            ],
          ),
        );
      },
      child: BoxText.body(
        title,
        color: Colors.white,
      ),
    );
  }
}
