part of 'extensions.dart';

extension SnackBarExtension on BuildContext {
  /// Fungsi Snackbar Generik yang menimpa snackbar lama secara default
  void showSnackBar({
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    IconData? icon,
    bool replaceCurrent = true,
  }) {
    // Logika pembersihan (Overwriting)
    if (replaceCurrent) {
      ScaffoldMessenger.of(this).removeCurrentSnackBar();
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.grey[800],
        duration: duration,
        action: action,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  //Shortcut untuk memanggil SnackBar Error dengan cepat
  void showErrorSnackBar(
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    showSnackBar(
      duration: duration,
      message: message,
      backgroundColor: Colors.red[400],
      icon: LucideIcons.circleAlert,
    );
  }

  //Shortcut untuk memanggil SnackBar Sukses
  void showSuccessSnackBar(
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    showSnackBar(
      duration: duration,
      message: message,
      backgroundColor: Colors.green[400],
      icon: LucideIcons.circleCheck,
    );
  }

  //Shortcut untuk memanggil SnackBar Netral
  void showNeutralSnackBar(
      String message, {
        Duration duration = const Duration(seconds: 3),
      }) {
    showSnackBar(
      duration: duration,
      message: message,
      backgroundColor: Colors.blue[400],
      icon: LucideIcons.circleQuestionMark,
    );
  }
}

extension ContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get mqWidth => MediaQuery.sizeOf(this).width;

  double get mqHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => mqWidth < 600;
}

extension UnFocus on BuildContext {
  void unFocus() {
    FocusScope.of(this).unfocus();
  }
}

extension LoadingExtension on BuildContext {
  void showLoading() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void hideLoading() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}
