import 'package:intl/intl.dart';

class DateHelper {
  static String getNamaHari(String? nomorHariString) {
    if (nomorHariString == null) return '';

    final nomorHari = int.tryParse(nomorHariString);
    if (nomorHari == null || nomorHari < 1 || nomorHari > 7) {
      return 'Input tidak valid';
    }

    final now = DateTime.now();
    final hari = DateTime(
      now.year,
      now.month,
      now.day + (nomorHari - now.weekday),
    );

    return DateFormat.EEEE('id_ID').format(hari);
  }
}
