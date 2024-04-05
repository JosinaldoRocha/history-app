import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'borders.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefix;

  final Widget? sufix;
  final TextInputType keyboardType;
  final bool isEnabled;
  final bool hasBorder;

  final String? hintText;
  final bool? obscureText;

  final String? labelText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final bool readOnly;
  final TextInputAction? action;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? lines;
  final AutovalidateMode? autoValidate;
  final TextAlign align;
  final bool hasPadding;

  /// FormInput
  ///
  /// [controller] form controller
  ///
  /// [prefix] is a prefix of input will be rendered on left side of input
  ///
  /// [type] type of text input
  ///
  /// [isEnable] is a bool that will be check if formInput is active
  ///
  /// [validator] function that validate input
  ///
  /// [onChanged] onChanged of formInput
  const InputWidget({
    required this.controller,
    this.isEnabled = true,
    this.hasBorder = true,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.hintText,
    this.sufix,
    this.autofillHints,
    this.labelText,
    this.obscureText,
    this.readOnly = false,
    this.inputFormatters,
    this.action,
    this.onSubmitted,
    this.lines,
    this.autoValidate,
    this.align = TextAlign.left,
    this.hasPadding = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autoValidate,
      onChanged: onChanged,
      enabled: isEnabled,
      autofillHints: autofillHints,
      controller: controller,
      textInputAction: action,
      textAlignVertical: TextAlignVertical.center,
      onFieldSubmitted: onSubmitted,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      maxLines: lines,
      style: const TextStyle(
        color: Color(0xff828282),
        fontSize: 20,
      ),
      textAlign: align,
      decoration: InputDecoration(
        contentPadding: hasPadding
            ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5)
            : null,
        border: InputBorderType.getBorder(hasBorder),
        enabledBorder: InputBorderType.getBorder(hasBorder),
        disabledBorder: InputBorderType.getBorder(hasBorder),
        focusedBorder: InputBorderType.getBorder(hasBorder),
        errorBorder: InputBorderType.getBorder(hasBorder),
        focusedErrorBorder: InputBorderType.getBorder(hasBorder),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xff4f4f4f),
          fontSize: 14,
        ),
        prefixIcon: prefix,
        hintStyle: const TextStyle(
          color: Color(0xffc1bcbc),
          fontSize: 18,
        ),
        hintText: hintText,
        suffixIcon: sufix,
      ),
    );
  }
}
