// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../features/authentication/presentation/authentication_screen/logic/authentication_bloc.dart';
// import '../../features/authentication/presentation/role_user/role_user_bloc.dart';
// import '../../features/fetch/sistem/domain/entity/role/role.dart';
// import '../app_themes/themes/app_themes.dart';
// import 'restricted_authorization_view.dart';
//
// class AppScaffold extends StatelessWidget {
//   final Widget body;
//   final PreferredSizeWidget? appBar;
//   final Widget? floatingActionButton;
//   final FloatingActionButtonLocation? floatingActionButtonLocation;
//   final Widget? bottomNavigationBar;
//   final bool? resizeToAvoidBottomInset;
//   final Color? backgroundColor;
//   final SystemUiOverlayStyle? systemUiOverlayStyle;
//   final bool useSafeArea;
//
//   // --- Parameter Otorisasi & Role ---
//   /// Apakah halaman ini mewajibkan pengguna untuk ter-autentikasi (login).
//   final bool requireAuth;
//
//   /// Daftar role yang diizinkan untuk mengakses halaman ini.
//   ///
//   /// Dapat berupa `RoleEnum`, `String` roleId, atau `String` roleName
//   /// (contoh: `[RoleEnum.administrator]`, `['admin', 'pegawai']`, atau `['1', '2']`).
//   final List<dynamic>? allowedRoles;
//
//   /// ID Menu spesifik yang wajib dimiliki oleh role aktif di dalam `menuTree`.
//   /// Gunakan `'always'` jika selalu diizinkan.
//   final String? requiredMenuId;
//
//   /// Kondisi kustom tambahan untuk menentukan apakah pengguna memiliki otorisasi.
//   final bool Function(BuildContext context)? customAuthCondition;
//
//   /// Widget alternatif khusus untuk ditampilkan ketika otorisasi ditolak.
//   final Widget? customRestrictedView;
//
//   /// Judul tampilan ketika akses dibatasi.
//   final String? restrictedTitle;
//
//   /// Pesan atau penjelasan ketika akses dibatasi.
//   final String? restrictedMessage;
//
//   /// Callback untuk tombol aksi utama pada tampilan restricted authorization.
//   final VoidCallback? onRestrictedAction;
//
//   /// Label tombol aksi utama pada tampilan restricted authorization.
//   final String? restrictedActionLabel;
//
//   const AppScaffold({
//     super.key,
//     required this.body,
//     this.appBar,
//     this.floatingActionButton,
//     this.floatingActionButtonLocation,
//     this.bottomNavigationBar,
//     this.resizeToAvoidBottomInset,
//     this.backgroundColor,
//     this.systemUiOverlayStyle,
//     this.useSafeArea = true,
//     this.requireAuth = false,
//     this.allowedRoles,
//     this.requiredMenuId,
//     this.customAuthCondition,
//     this.customRestrictedView,
//     this.restrictedTitle,
//     this.restrictedMessage,
//     this.onRestrictedAction,
//     this.restrictedActionLabel,
//   });
//
//   /// Memeriksa apakah halaman membutuhkan aturan otorisasi/role.
//   bool get _hasAuthorizationRules =>
//       requireAuth ||
//       (allowedRoles != null && allowedRoles!.isNotEmpty) ||
//       (requiredMenuId != null && requiredMenuId!.isNotEmpty) ||
//       customAuthCondition != null;
//
//   @override
//   Widget build(BuildContext context) {
//     final authState = _hasAuthorizationRules ? _getAuthState(context) : null;
//     final roleState = _hasAuthorizationRules ? _getRoleUserState(context) : null;
//
//     final reason = _checkAuthorization(context, authState, roleState);
//     final bool isRestricted = reason != RestrictedReason.none;
//
//     final Widget content = isRestricted
//         ? (customRestrictedView ??
//               RestrictedAuthorizationView(
//                 reason: reason,
//                 title: restrictedTitle,
//                 message: restrictedMessage,
//                 onAction: onRestrictedAction,
//                 actionLabel: restrictedActionLabel,
//                 activeRoleName: _getActiveRoleName(authState, roleState),
//                 isAuthenticated: _isAuthenticated(authState, roleState),
//               ))
//         : body;
//
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value:
//           systemUiOverlayStyle ??
//           const SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//             statusBarIconBrightness: Brightness.light,
//           ),
//       child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           body: useSafeArea ? SafeArea(child: content) : content,
//           backgroundColor: backgroundColor ?? (isRestricted ? AppColors.scaffoldBackground : null),
//           appBar: appBar,
//           floatingActionButton: isRestricted ? null : floatingActionButton,
//           floatingActionButtonLocation: isRestricted ? null : floatingActionButtonLocation,
//           bottomNavigationBar: isRestricted ? null : bottomNavigationBar,
//           resizeToAvoidBottomInset: resizeToAvoidBottomInset,
//         ),
//       ),
//     );
//   }
//
//   /// Memeriksa apakah pengguna saat ini diizinkan mengakses halaman berdasarkan aturan yang ditentukan.
//   static bool isAuthorized(
//     BuildContext context, {
//     bool requireAuth = false,
//     List<dynamic>? allowedRoles,
//     String? requiredMenuId,
//     bool Function(BuildContext context)? customAuthCondition,
//   }) {
//     final scaffold = AppScaffold(
//       body: const SizedBox(),
//       requireAuth: requireAuth,
//       allowedRoles: allowedRoles,
//       requiredMenuId: requiredMenuId,
//       customAuthCondition: customAuthCondition,
//     );
//     final authState = scaffold._getAuthState(context);
//     final roleState = scaffold._getRoleUserState(context);
//     return scaffold._checkAuthorization(context, authState, roleState) == RestrictedReason.none;
//   }
//
//   RestrictedReason _checkAuthorization(
//     BuildContext context,
//     AuthenticationState? authState,
//     RoleUserState? roleState,
//   ) {
//     if (!_hasAuthorizationRules) return RestrictedReason.none;
//
//     // 1. Cek Autentikasi
//     if (requireAuth && !_isAuthenticated(authState, roleState)) {
//       return RestrictedReason.unauthenticated;
//     }
//
//     // 2. Cek Role yang diizinkan (allowedRoles)
//     if (allowedRoles != null && allowedRoles!.isNotEmpty) {
//       bool isRoleAllowed = false;
//       for (final target in allowedRoles!) {
//         if (target == null) continue;
//         final String targetStr = target.toString().trim().toLowerCase();
//
//         // Cek dari RoleUserBloc (role aktif saat ini)
//         if (roleState != null && roleState.activeRole != Role.empty) {
//           final active = roleState.activeRole;
//           if (target == active.role ||
//               targetStr == active.role.name.toLowerCase() ||
//               targetStr == active.roleId.trim().toLowerCase() ||
//               targetStr == active.roleName.trim().toLowerCase()) {
//             isRoleAllowed = true;
//             break;
//           }
//         }
//
//         // Cek dari AuthenticationBloc (role saat login)
//         if (authState != null) {
//           final bool authMatch = authState.maybeWhen(
//             authenticated: (role) => target == role || targetStr == role.name.toLowerCase(),
//             orElse: () => false,
//           );
//           if (authMatch) {
//             isRoleAllowed = true;
//             break;
//           }
//         }
//       }
//
//       if (!isRoleAllowed) {
//         return RestrictedReason.unauthorizedRole;
//       }
//     }
//
//     // 3. Cek Akses Menu (requiredMenuId)
//     if (requiredMenuId != null && requiredMenuId!.isNotEmpty && requiredMenuId != 'always') {
//       final bool hasMenuAccess =
//           roleState != null && roleState.activeRole != Role.empty && roleState.activeRole.menuTree.any((m) => m.menuId == requiredMenuId);
//
//       if (!hasMenuAccess) {
//         return RestrictedReason.unauthorizedMenu;
//       }
//     }
//
//     // 4. Cek Kondisi Kustom Tambahan
//     if (customAuthCondition != null && !customAuthCondition!(context)) {
//       return RestrictedReason.custom;
//     }
//
//     return RestrictedReason.none;
//   }
//
//   bool _isAuthenticated(
//     AuthenticationState? authState,
//     RoleUserState? roleState,
//   ) {
//     final bool authBlocAuthenticated =
//         authState?.maybeWhen(
//           authenticated: (_) => true,
//           orElse: () => false,
//         ) ??
//         false;
//     final bool hasActiveRole = roleState != null && roleState.activeRole != Role.empty;
//     return authBlocAuthenticated || hasActiveRole;
//   }
//
//   String _getActiveRoleName(
//     AuthenticationState? authState,
//     RoleUserState? roleState,
//   ) {
//     if (roleState != null && roleState.activeRole != Role.empty) {
//       if (roleState.activeRole.roleName.isNotEmpty) {
//         return roleState.activeRole.roleName;
//       }
//       if (roleState.activeRole.role != RoleEnum.unknown) {
//         return _formatEnumName(roleState.activeRole.role.name);
//       }
//     }
//     if (authState != null) {
//       final String fromAuth = authState.maybeWhen(
//         authenticated: (role) => _formatEnumName(role.name),
//         orElse: () => '',
//       );
//       if (fromAuth.isNotEmpty) return fromAuth;
//     }
//     return '';
//   }
//
//   String _formatEnumName(String name) {
//     if (name.isEmpty) return '';
//     return name[0].toUpperCase() + name.substring(1);
//   }
//
//   AuthenticationState? _getAuthState(BuildContext context) {
//     try {
//       return context.watch<AuthenticationBloc>().state;
//     } catch (_) {
//       return null;
//     }
//   }
//
//   RoleUserState? _getRoleUserState(BuildContext context) {
//     try {
//       return context.watch<RoleUserBloc>().state;
//     } catch (_) {
//       return null;
//     }
//   }
// }
//
// /// Tampilan antarmuka khusus ketika akses halaman dibatasi
// /// karena autentikasi atau role tidak sesuai.
