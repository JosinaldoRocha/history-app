// import 'package:flutter/services.dart';

// class ValidatorFormatters {
//   static TextInputFormatter date() {
//     return MaskTextInputFormatter(
//       mask: '##/##/####',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy,
//     );
//   }

//   static TextInputFormatter phone() {
//     return MaskTextInputFormatter(
//       mask: '(##) #####-####',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy,
//     );
//   }

//   static TextInputFormatter cpf() {
//     return CpfInputFormatter();
//   }

//   static TextInputFormatter cnpj() {
//     return CnpjInputFormatter();
//   }

//   static TextInputFormatter cep() {
//     return MaskTextInputFormatter(
//       mask: '#####-###',
//       filter: {"#": RegExp(r'[0-9]')},
//       type: MaskAutoCompletionType.lazy,
//     );
//   }
// }
