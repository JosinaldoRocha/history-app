import 'package:flutter/material.dart';

class CircularButtonWidget extends StatelessWidget {
  const CircularButtonWidget({
    Key? key,
    required this.title,
    required this.onPresed,
    required this.icon,
    this.color,
  }) : super(key: key);
  final String title;
  final Function()? onPresed;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                color ?? const Color.fromRGBO(0, 158, 253, 1),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            onPressed: onPresed,
            child: Icon(
              icon,
              size: 48,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
