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
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 140, 170, 143),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              color: const Color.fromARGB(255, 202, 243, 206),
              child: AlertDialog(
                actions: [
                  textField,
                  Center(
                    child: widgetFunction,
                  ),
                ],
              ),
            ),
          );
        },
        child: BoxText.body(
          title,
          size: 17,
        ),
      ),
    );
  }
}
