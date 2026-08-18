import 'package:flutter/material.dart';

import '../app_themes/themes/app_themes.dart';

class CustomBottomSheet {
  /// Menampilkan bottom sheet yang terstandarisasi dengan SafeArea, tinggi dinamis (menyesuaikan konten),
  /// dan menghindari navbar sistem serta keyboard.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget content,
    bool isScrollControlled = true,
    bool expand = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: false,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            height: expand ? MediaQuery.of(context).size.height * 0.9 : null,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.zn300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.zn800,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: AppColors.zn500,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Flexible(
                  child: content,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
