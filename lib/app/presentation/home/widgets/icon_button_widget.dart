import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    required this.icon,
    required this.size,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final double size;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
        ),
        onPressed: onTap,
      ),
    );
  }
}
