import 'package:flutter/material.dart';
import '../../../../shared/widgets/texts/box_text.dart';

class EditItemContentWidget extends StatelessWidget {
  const EditItemContentWidget({
    super.key,
    required this.title,
    required this.textField,
    required this.widgetFunction,
  });

  final String title;
  final Widget textField;
  final Widget widgetFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(26, 146, 141, 141),
          elevation: 0,
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
        child: BoxText.body(title),
      ),
    );
  }
}
