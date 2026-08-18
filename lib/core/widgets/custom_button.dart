import 'package:flutter/material.dart';

import '../app_themes/themes/app_themes.dart';

enum ButtonType {
  primary,
  secondary,
  outline,
  danger,
  success,
  ghost;

  // Mendapatkan warna background berdasarkan tipe
  Color get backgroundColor {
    switch (this) {
      case ButtonType.primary:
        return AppColors.primary;
      case ButtonType.secondary:
        return AppColors.secondary;
      case ButtonType.outline:
        return Colors.transparent;
      case ButtonType.danger:
        return AppColors.error;
      case ButtonType.success:
        return AppColors.success;
      case ButtonType.ghost:
        return Colors.transparent;
    }
  }

  // Mendapatkan warna teks/icon berdasarkan tipe
  Color get foregroundColor {
    switch (this) {
      case ButtonType.primary:
      case ButtonType.secondary:
      case ButtonType.danger:
      case ButtonType.success:
        return Colors.white;
      case ButtonType.outline:
        return AppColors.primary;
      case ButtonType.ghost:
        return AppColors.zn500;
    }
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.isLoading = false,
    this.isFullWidth = true,
    this.leadingIcon,
    this.trailingIcon,
    this.borderRadius = 10,
    this.padding,
    this.width,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    // Tombol otomatis disabled jika sedang loading
    final bool isDisabled = onPressed == null || isLoading;
    final bool isFull = isFullWidth && label.isNotEmpty;

    return SizedBox(
      width: isFull ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: type.backgroundColor,
          foregroundColor: type.foregroundColor,
          elevation: type == ButtonType.ghost || type == ButtonType.outline
              ? 0
              : 2,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: type == ButtonType.outline
                ? BorderSide(color: AppColors.primary, width: 1.5)
                : BorderSide.none,
          ),
          disabledBackgroundColor: AppColors.hintColor,
        ),
        child: isLoading ? _buildLoader() : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          Icon(leadingIcon, size: 20),
          if (label.isNotEmpty) const SizedBox(width: 8),
        ],
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        if (trailingIcon != null) ...[
          if (label.isNotEmpty) const SizedBox(width: 8),
          Icon(trailingIcon, size: 20),
        ],
      ],
    );
  }

  Widget _buildLoader() {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(
          type == ButtonType.outline || type == ButtonType.ghost
              ? AppColors.primary
              : Colors.white,
        ),
      ),
    );
  }
}
