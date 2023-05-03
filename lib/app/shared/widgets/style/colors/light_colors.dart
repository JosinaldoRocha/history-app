import 'package:flutter/material.dart';
import 'colors_interface.dart';

class LightColors implements ColorsInterface {
  static Color get brand1 => const Color(0xff6DBCE9);
  static Color get brand2 => const Color(0xff6DBCE9);
  static Color get brand3 => const Color(0xffE8BA78);

  @override
  Color get kcBlack1 => const Color(0x8a000000);

  @override
  Color get kcBlack2 => const Color(0xdd000000);

  @override
  Color get kcCardBackground => Colors.white;

  @override
  Color get kcError => const Color(0xffd32f2f);

  Color get kcBlue => const Color.fromRGBO(0, 138, 209, 1);

  @override
  Color get kcGrey => const Color(0xff646464);

  @override
  Color get kcGrey2 => const Color(0xff808080);

  @override
  Color get kcLightGrey => const Color(0xffE5E5E5);

  @override
  Color get kcMediumGrey => const Color(0xff868686);

  @override
  Color get kcPrimary => brand1;

  @override
  Color get kcScafoldBackground => Colors.white;

  @override
  Color get kcSuccess => const Color(0xff5BA092);

  @override
  Color get kcTextColor => Colors.black;

  @override
  Color get kcTextFieldBackground => Colors.grey.shade200;

  @override
  Color get kcVeryLightGrey => const Color(0xfff2f2f2);

  @override
  Color get kcWarning => const Color(0xFFFED80A);

  @override
  Color get kcSecondary => const Color.fromRGBO(232, 186, 120, 1);
}
