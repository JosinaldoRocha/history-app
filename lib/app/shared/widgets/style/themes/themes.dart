import 'package:my_history_app/app/shared/widgets/style/colors/dark_colors.dart';
import 'package:my_history_app/app/shared/widgets/style/colors/light_colors.dart';
import 'app_theme.dart';

class Themes {
  static final light = AppThemes.themeGenerator(LightColors());
  static final dark = AppThemes.themeGenerator(DarkColors());
}
