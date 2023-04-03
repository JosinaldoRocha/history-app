import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_history_app/app/modules/register/data/models/user_model.dart';

import '../../../shared/widgets/texts/box_text.dart';

class TextFieldLoginWidget extends ConsumerWidget {
  const TextFieldLoginWidget({
    super.key,
    required this.controller,
    required this.items,
    required this.validator,
    this.suffixIcon,
    this.obscureText = false,
    required this.label,
  });
  final TextEditingController controller;
  final List<UserModel> items;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      decoration: InputDecoration(
        label: BoxText.body(label),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 148, 146, 146),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 148, 146, 146),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 148, 146, 146),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 148, 146, 146),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: (p0) {
        controller.text;
      },
      validator: validator,
    );
  }
}
