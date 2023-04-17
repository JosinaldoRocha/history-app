import 'package:flutter/material.dart';

class EyePasswordWidget extends StatelessWidget {
  const EyePasswordWidget({
    Key? key,
    this.isObscure = false,
    required this.onChanged,
  }) : super(key: key);

  final bool isObscure;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: IconButton(
        onPressed: onChanged,
        icon: Icon(
          isObscure ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
        ),
      ),
    );
  }
}
