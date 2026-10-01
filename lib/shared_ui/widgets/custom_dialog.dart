import 'package:flutter/material.dart';

import '../app_themes/themes/app_themes.dart';

class CustomDialog {
  /// Dialog dasar yang sangat modular
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useRootNavigator: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.zn800,
          ),
        ),
        content: content,
        actions: actions,
      ),
    );
  }

  /// Dialog konfirmasi standar (Batal / OK)
  static Future<bool?> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'OK',
    String cancelText = 'Batal',
    Color confirmColor = AppColors.primary,
    VoidCallback? onConfirm,
  }) {
    return show<bool>(
      context: context,
      title: title,
      barrierDismissible: false,
      content: Text(
        message,
        style: const TextStyle(color: AppColors.zn700, fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            cancelText,
            style: const TextStyle(color: AppColors.zn500),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
            if (onConfirm != null) {
              onConfirm();
            }
          },
          child: Text(
            confirmText,
            style: TextStyle(
              color: confirmColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  /// Dialog informasi standar (hanya tombol tutup)
  static Future<void> showInformation({
    required BuildContext context,
    required String title,
    required String message,
    String buttonText = 'Tutup',
  }) {
    return show<void>(
      context: context,
      title: title,
      content: Text(
        message,
        style: const TextStyle(color: AppColors.zn700, fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
