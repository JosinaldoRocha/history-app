import 'package:design_system/src/style/colors/dark_colors.dart';
import 'package:design_system/src/style/colors/light_colors.dart';

import 'app_theme.dart';

class Themes {
  static final light = AppThemes.themeGenerator(LightColors());
  static final dark = AppThemes.themeGenerator(DarkColors());
}
