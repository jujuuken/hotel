// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
//
// import '../../app_themes/themes/app_themes.dart';
//
// class FileHelper {
//   static Future<File> byteToFile(Uint8List bytes, String filename) async {
//     final dir = await getTemporaryDirectory();
//     final file = File('${dir.path}/$filename');
//     return await file.writeAsBytes(bytes, flush: true);
//   }
//
//   static Future<void> savePdfExternal({
//     String? fileName,
//     List<int>? fileByte,
//     String? filePath,
//   }) async {
//     try {
//       final String finalFileName = fileName ?? 'document_${DateTime
//           .now()
//           .millisecondsSinceEpoch}.pdf';
//       Directory? targetDir;
//       if (Platform.isAndroid) {
//         targetDir = Directory('/storage/emulated/0/Download');
//         if (!await targetDir.exists()) {
//           targetDir = await getExternalStorageDirectory();
//         }
//       } else if (Platform.isIOS) {
//         targetDir = await getApplicationDocumentsDirectory();
//       } else {
//         targetDir = await getDownloadsDirectory();
//       }
//
//       final String folderPath = targetDir?.path ?? (await getTemporaryDirectory()).path;
//       final String targetPath = p.join(folderPath, finalFileName);
//       final File targetFile = File(targetPath);
//
//       if (filePath != null) {
//         final File sourceFile = File(filePath);
//         if (await sourceFile.exists()) {
//           await sourceFile.copy(targetFile.path);
//         }
//       } else if (fileByte != null) {
//         await targetFile.writeAsBytes(fileByte, flush: true);
//       }
//
//       // Open the file directly for the user
//       if (await targetFile.exists()) {
//         await OpenFile.open(targetFile.path);
//       }
//     } catch (e) {
//       debugPrint('Error saving/opening file: $e');
//     }
//   }
//
//   static Future<File?> pickFile(BuildContext context, {
//     bool allowCamera = false,
//     bool allowGallery = false,
//     bool allowPdf = true,
//     List<String> allowedPdfExtensions = const ['pdf'],
//   }) async {
//     // Jika hanya mengizinkan dokumen PDF, langsung buka FilePicker tanpa bottom sheet
//     if (!allowCamera && !allowGallery && allowPdf) {
//       final result = await FilePicker.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: allowedPdfExtensions,
//       );
//       if (result != null && result.files.single.path != null) {
//         return File(result.files.single.path!);
//       }
//       return null;
//     }
//
//     // Jika ada lebih dari satu opsi, tampilkan bottom sheet
//     return await showModalBottomSheet<File>(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (BuildContext context) {
//         final picker = ImagePicker();
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               if (allowCamera)
//                 ListTile(
//                   leading: const Icon(
//                     LucideIcons.camera,
//                     color: AppColors.primary,
//                   ),
//                   title: const Text('Ambil Foto Kamera'),
//                   onTap: () async {
//                     final image = await picker.pickImage(
//                       source: ImageSource.camera,
//                     );
//                     if (image != null) {
//                       if (context.mounted) Navigator.of(context).pop(File(image.path));
//                     } else {
//                       if (context.mounted) Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//               if (allowGallery)
//                 ListTile(
//                   leading: const Icon(
//                     LucideIcons.image,
//                     color: AppColors.primary,
//                   ),
//                   title: const Text('Pilih dari Galeri'),
//                   onTap: () async {
//                     final image = await picker.pickImage(
//                       source: ImageSource.gallery,
//                     );
//                     if (image != null) {
//                       if (context.mounted) Navigator.of(context).pop(File(image.path));
//                     } else {
//                       if (context.mounted) Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//               if (allowPdf)
//                 ListTile(
//                   leading: const Icon(
//                     LucideIcons.fileText,
//                     color: AppColors.primary,
//                   ),
//                   title: const Text('Pilih Dokumen'),
//                   onTap: () async {
//                     final result = await FilePicker.pickFiles(
//                       type: FileType.custom,
//                       allowedExtensions: allowedPdfExtensions,
//                     );
//                     if (result != null && result.files.single.path != null) {
//                       if (context.mounted) {
//                         Navigator.of(
//                           context,
//                         ).pop(File(result.files.single.path!));
//                       }
//                     } else {
//                       if (context.mounted) Navigator.of(context).pop();
//                     }
//                   },
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
