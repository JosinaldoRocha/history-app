
// import 'package:intl/intl.dart';

// class Validators {
//   static String? phone(String? text) {
//     if (text!.length < 11) {
//       return 'Telefone inválido';
//     }
//     return null;
//   }

//   static String? cpf(String? text) {
//     if (!CPFValidator.isValid(text)) {
//       return 'CPF inválido';
//     }
//     return null;
//   }

//   static String? cnpj(String? text) {
//     if (!CNPJValidator.isValid(text)) {
//       return 'CNPJ inválido';
//     }
//     return null;
//   }

//   static String? email(String? text) {
//     bool emailValid = RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(text ?? '');
//     if (!emailValid) {
//       return "Email inválido";
//     }
//     return null;
//   }

//   static String? date(String? text, {int howManyYears = 0}) {
//     try {
//       final date = DateFormat.yMd().parse(text!);

//       if (date.isAfter(
//           DateTime.now().subtract(Duration(days: 365 * howManyYears)))) {
//         return 'Apenas maiores de $howManyYears anos';
//       }
//       return null;
//     } catch (e) {
//       return 'Data Inválida';
//     }
//   }
// }
