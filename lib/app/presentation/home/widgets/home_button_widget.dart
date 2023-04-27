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
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
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
