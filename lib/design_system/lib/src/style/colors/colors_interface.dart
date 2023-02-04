import 'package:flutter/material.dart';

abstract class ColorsInterface {
  final Color kcPrimary;
  final Color kcMediumGrey;
  final Color kcLightGrey;
  final Color kcVeryLightGrey;
  final Color kcGrey;
  final Color kcBlack1;
  final Color kcBlack2;
  final Color kcError;
  final Color kcSuccess;
  final Color kcWarning;
  final Color kcGrey2;
  final Color kcTextColor;
  final Color kcScafoldBackground;
  final Color kcCardBackground;
  final Color kcTextFieldBackground;
  final Color kcSecondary;

  ColorsInterface({
    required this.kcPrimary,
    required this.kcMediumGrey,
    required this.kcLightGrey,
    required this.kcVeryLightGrey,
    required this.kcGrey,
    required this.kcBlack2,
    required this.kcError,
    required this.kcSuccess,
    required this.kcWarning,
    required this.kcGrey2,
    required this.kcTextColor,
    required this.kcScafoldBackground,
    required this.kcCardBackground,
    required this.kcTextFieldBackground,
    required this.kcBlack1,
    required this.kcSecondary,
  });
}
