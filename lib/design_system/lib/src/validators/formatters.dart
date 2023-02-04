import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ValidatorFormatters {
  static TextInputFormatter date() {
    return MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static TextInputFormatter phone() {
    return MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  static TextInputFormatter cpf() {
    return CpfInputFormatter();
  }

  static TextInputFormatter cnpj() {
    return CnpjInputFormatter();
  }

  static TextInputFormatter cep() {
    return MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
  }
}
