import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_themes/themes/app_themes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.centerTitle,
    this.systemOverlayStyle,
    this.iconTheme,
    this.actionsIconTheme,
    this.titleTextStyle,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final bool? centerTitle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: actions,
      bottom: bottom,
      backgroundColor: AppColors.primary,
      centerTitle: centerTitle,
      systemOverlayStyle: systemOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
      iconTheme: iconTheme ?? const IconThemeData(color: Colors.white),
      actionsIconTheme: actionsIconTheme ?? const IconThemeData(color: Colors.white),
      titleTextStyle: titleTextStyle ??
          Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ) ??
          const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize.height ?? 0.0),
  );
}
