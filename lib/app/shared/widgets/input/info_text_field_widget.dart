import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/input/input_widget.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.hasQRread = false,
    this.sufix,
    this.isEnable = true,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? sufix;
  final bool hasQRread;
  final bool isEnable;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.body(label),
          const SizedBox(height: 5),
          InputWidget(
            onChanged: onTap,
            keyboardType: keyboardType,
            sufix: !hasQRread
                ? sufix
                : IconButton(
                    onPressed: () async {
                      final result =
                          await Navigator.pushNamed(context, "/bar-code");

                      if (result != null) {
                        controller.text = result.toString();
                      }
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
            controller: controller,
            hintText: hintText,
            isEnabled: isEnable,
            validator: validator ??
                (p0) {
                  if (p0!.isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
          ),
        ],
      ),
    );
  }
}
