import 'package:flutter/material.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

part '../colors/app_colors.dart';

part '../text_style/app_text_style.dart';

part '../text_style/font_weight_helper.dart';

sealed class AppThemes {
  static ThemeData dark() {
    return AppDarkThemes.call();
  }

  static ThemeData light() {
    return AppLightThemes.call();
  }
}
