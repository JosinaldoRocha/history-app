import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxText.body(
              title,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
