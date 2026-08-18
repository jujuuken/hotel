import 'package:flutter/material.dart';

import '../app_themes/themes/app_themes.dart';
import 'custom_button.dart';

enum RestrictedReason {
  none,
  unauthenticated,
  unauthorizedRole,
  unauthorizedMenu,
  custom,
}

class RestrictedAuthorizationView extends StatelessWidget {
  final RestrictedReason reason;
  final String? title;
  final String? message;
  final VoidCallback? onAction;
  final String? actionLabel;
  final String? activeRoleName;
  final bool isAuthenticated;

  const RestrictedAuthorizationView({
    super.key,
    this.reason = RestrictedReason.unauthorizedRole,
    this.title,
    this.message,
    this.onAction,
    this.actionLabel,
    this.activeRoleName,
    this.isAuthenticated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.zn200, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.04),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildIconBadge(),
              const SizedBox(height: 24),
              Text(
                title ?? _defaultTitle,
                style: AppTextStyle.style20Bold.copyWith(
                  color: AppColors.mainColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                message ?? _defaultMessage,
                style: AppTextStyle.style14Regular.copyWith(
                  color: AppColors.zn600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildStatusBadge(),
              const SizedBox(height: 28),
              _buildActions(context),
              if (reason == RestrictedReason.unauthorizedRole || reason == RestrictedReason.unauthorizedMenu) _buildInfoBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBadge() {
    final Color accentColor = _accentColor;
    final IconData iconData = _iconData;

    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            size: 38,
            color: accentColor,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    if (!isAuthenticated) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.no_accounts_outlined,
              size: 16,
              color: AppColors.error,
            ),
            const SizedBox(width: 8),
            Text(
              'Status: Belum Terautentikasi',
              style: AppTextStyle.style12Medium.copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ),
      );
    }

    final String roleDisplayName = activeRoleName != null && activeRoleName!.isNotEmpty ? activeRoleName! : 'Pengguna Terautentikasi';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.zn100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.zn200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.verified_user_outlined,
            size: 16,
            color: AppColors.zn700,
          ),
          const SizedBox(width: 8),
          Text(
            'Role Aktif: $roleDisplayName',
            style: AppTextStyle.style12Medium.copyWith(
              color: AppColors.zn700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onAction != null) ...[
          CustomButton(
            label: actionLabel ?? 'Tindakan',
            onPressed: onAction,
            type: ButtonType.primary,
          ),
          if (canPop) ...[
            const SizedBox(height: 12),
            CustomButton(
              label: 'Kembali',
              onPressed: () => Navigator.of(context).maybePop(),
              type: ButtonType.secondary,
            ),
          ],
        ] else if (canPop) ...[
          CustomButton(
            label: actionLabel ?? 'Kembali',
            onPressed: () => Navigator.of(context).maybePop(),
            type: ButtonType.primary,
          ),
        ],
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.zn50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.zn200),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: AppColors.zn500,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Jika Anda merasa ada kesalahan pada hak akses ini, silakan hubungi tim Administrator E-SAKIP.',
              style: AppTextStyle.style14Regular.copyWith(
                color: AppColors.zn600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color get _accentColor {
    switch (reason) {
      case RestrictedReason.unauthenticated:
        return AppColors.primary;
      case RestrictedReason.unauthorizedRole:
        return AppColors.primary;
      case RestrictedReason.unauthorizedMenu:
        return AppColors.warning;
      case RestrictedReason.custom:
      case RestrictedReason.none:
        return AppColors.blue;
    }
  }

  IconData get _iconData {
    switch (reason) {
      case RestrictedReason.unauthenticated:
        return Icons.lock_outline_rounded;
      case RestrictedReason.unauthorizedRole:
        return Icons.admin_panel_settings_outlined;
      case RestrictedReason.unauthorizedMenu:
        return Icons.gpp_bad_outlined;
      case RestrictedReason.custom:
      case RestrictedReason.none:
        return Icons.security_rounded;
    }
  }

  String get _defaultTitle {
    switch (reason) {
      case RestrictedReason.unauthenticated:
        return 'Autentikasi Diperlukan';
      case RestrictedReason.unauthorizedRole:
        return 'Akses Role Dibatasi';
      case RestrictedReason.unauthorizedMenu:
        return 'Izin Menu Tidak Tersedia';
      case RestrictedReason.custom:
      case RestrictedReason.none:
        return 'Akses Terbatas';
    }
  }

  String get _defaultMessage {
    switch (reason) {
      case RestrictedReason.unauthenticated:
        return 'Anda perlu login terlebih dahulu untuk dapat mengakses halaman dan fitur pada bagian ini.';
      case RestrictedReason.unauthorizedRole:
        return 'Role Anda saat ini tidak memiliki izin yang sesuai untuk mengakses halaman ini. Silakan hubungi administrator atau gunakan akun dengan role yang diizinkan.';
      case RestrictedReason.unauthorizedMenu:
        return 'Role aktif Anda saat ini tidak memiliki hak akses pada menu ini. Silakan hubungi administrator untuk penambahan izin akses.';
      case RestrictedReason.custom:
      case RestrictedReason.none:
        return 'Anda tidak memiliki otorisasi yang dibutuhkan untuk membuka halaman ini.';
    }
  }
}
