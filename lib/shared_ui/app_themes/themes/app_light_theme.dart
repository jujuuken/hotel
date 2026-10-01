import 'package:flutter/material.dart';

import 'app_themes.dart';

sealed class AppLightThemes {
  static ThemeData call() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      fontFamily: 'SairaSemiCondensed',
      fontFamilyFallback: ['Cairo'],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.appbarBackgroundLight,
        actionsIconTheme: IconThemeData(color: AppColors.zn900),
        titleTextStyle: TextStyle(
          color: AppColors.zn900,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: AppColors.zn900),
      ),
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        onSurface: AppColors.zn900,
      ),
      switchTheme: SwitchThemeData(
        thumbIcon: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? const Icon(Icons.check, color: AppColors.white, size: 20)
              : const Icon(Icons.close, size: 20),
        ),
        trackColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.zn200,
        ),
        thumbColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? AppColors.white
              : AppColors.zn400,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
              (states) =>
          states.contains(WidgetState.selected) ? null : AppColors.zn300,
        ),
      ),
      badgeTheme: const BadgeThemeData(backgroundColor: AppColors.primary),
      sliderTheme: SliderThemeData(
        trackHeight: 7,
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.zn200,
        thumbColor: AppColors.primary,
        overlayColor: AppColors.primary.withValues(alpha: 0.2),
        valueIndicatorColor: AppColors.primary,
        showValueIndicator: ShowValueIndicator.onlyForContinuous,
        valueIndicatorStrokeColor: AppColors.primary,
        valueIndicatorTextStyle: AppTextStyle.style14Medium.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
