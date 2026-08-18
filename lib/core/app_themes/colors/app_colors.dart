part of '../themes/app_themes.dart';

sealed class AppColors {
  // Brand Colors (Red dominant, modern minimalist)
  static const Color primary = Color(0xFFE40114); // Brand Vibrant Red
  static const Color secondary = Color(
    0xFFB3000C,
  ); // Deep Dark Red (gradients & primary dark elements)
  static const Color accent = Color(0xFFF43F5E); // Rose-Red Accent
  static const Color mainColor =
      black; // Main theme foreground text/black (Light theme default)

  /// Global App colors
  static const Color blueGreyOpacity15 = Color(0x26607D8B);
  static const Color blueGreyOpacity2 = Color(0x33607D8B);
  static const Color blue = Color(0xFF007AFF); // Accent Blue
  static const Color green = Color(0xFF10B981); // Modern emerald green
  static const Color red = Color(0xFFEF4444); // Vibrant rose red (for errors)
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  /// Theme Background Colors
  static const Color scaffoldBackgroundDark = zn950;
  static const Color appbarBackgroundDark = zn900;
  static const Color scaffoldBackgroundLight = zn50;
  static const Color appbarBackgroundLight = white;

  /// Default bindings (Light-mode dominant as requested)
  static const Color scaffoldBackground = scaffoldBackgroundLight;
  static const Color appbarBackground = appbarBackgroundLight;
  static const Color sidebarBackground = white;

  /// Global UI separations
  static const Color divider = zn100;
  static const Color appbarDivider = zn100;
  static const Color containerBackground = white;

  /// Progress Indicators (Clean Pastel Modern)
  static const Color greenProgress = Color(0xFF10B981); // Emerald-500
  static const Color lightBlueProgress = Color(0xFF0EA5E9); // Sky-500
  static const Color redProgress = Color(0xFFEF4444); // Red-500
  static const Color yellowProgress = Color(0xFFF59E0B); // Amber-500

  /// Text Form & Input Colors
  static const Color labelTextColor = zn600;
  static const Color hintColor = zn400;
  static const Color fillColor = zn50; // Soft gray background for text fields
  static const Color textFieldBorder = zn200; // Clean borders
  static const Color bookedChairColor = Color(0xFFE8E8E8);

  /// Zinc Neutral Color Scale (Tailwind Zinc Palette - Modern & Minimalist)
  static const Color zn25 = Color(0xFFFAFAFA);
  static const Color zn50 = Color(0xFFF4F4F5);
  static const Color zn100 = Color(0xFFE4E4E7);
  static const Color zn200 = Color(0xFFD4D4D8);
  static const Color zn300 = Color(0xFFA1A1AA);
  static const Color zn400 = Color(0xFF71717A);
  static const Color zn500 = Color(0xFF52525B);
  static const Color zn600 = Color(0xFF3F3F46);
  static const Color zn700 = Color(0xFF27272A);
  static const Color zn800 = Color(0xFF18181B);
  static const Color zn900 = Color(0xFF0F0F11);
  static const Color zn950 = Color(0xFF09090B);

  /// Semantic Statuses
  static const Color error = red;
  static const Color danger = red;
  static const Color success = green;
  static const Color warning = yellowProgress;
  static const Color info = blue;
}
