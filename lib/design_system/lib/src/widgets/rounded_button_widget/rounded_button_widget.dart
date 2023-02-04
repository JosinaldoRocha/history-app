import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({
    Key? key,
    required this.onTap,
    this.title = "Ver tudo",
    this.color,
    this.hasColor = false,
  }) : super(key: key);

  final String title;

  final Function() onTap;
  final bool hasColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        height: 25,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                hasColor ? color! : const Color(0xffF2F2F2)),
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(
              color: hasColor ? Colors.white : const Color(0xff828282),
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
