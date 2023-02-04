import 'package:flutter/material.dart';
import '../../../design_system.dart';

class InfoTextFieldWidget extends StatelessWidget {
  const InfoTextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.hasQRread = false,
    this.sufix,
    this.isEnable = true,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? sufix;
  final bool hasQRread;
  final bool isEnable;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          BoxText.body(label),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: InputWidget(
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
          )
        ],
      ),
    );
  }
}
