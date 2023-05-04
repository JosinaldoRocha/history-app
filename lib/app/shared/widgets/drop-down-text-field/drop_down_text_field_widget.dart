import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:my_history_app/app/shared/widgets/texts/box_text.dart';

class DropDownTextFieldWidget extends StatefulWidget {
  const DropDownTextFieldWidget({
    Key? key,
    required this.controller,
    required this.list,
    required this.label,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);
  final SingleValueDropDownController controller;
  final List<DropDownValueModel> list;
  final String label;
  final String hintText;
  final Function(dynamic)? onChanged;

  @override
  State<DropDownTextFieldWidget> createState() =>
      _DropDownTextFieldWidgetState();
}

class _DropDownTextFieldWidgetState extends State<DropDownTextFieldWidget> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxText.body(widget.label),
          const SizedBox(height: 10),
          DropDownTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Selecione um valor';
              }
              return null;
            },
            textFieldDecoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xffc1bcbc),
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black45),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            readOnly: true,
            controller: widget.controller,
            clearOption: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            dropDownItemCount: widget.list.length,
            dropDownList: widget.list,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
