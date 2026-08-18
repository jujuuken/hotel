import 'date_helper.dart';
import 'numeric_helper.dart';

class ConvertHelper {
  static String getNamaHari(String? nomorHariString) {
    return DateHelper.getNamaHari(nomorHariString);
  }

  static int hitungString(
    String? nilai1,
    String? nilai2, {
    bool selisih = false,
  }) {
    return NumericHelper.hitungString(nilai1, nilai2, selisih: selisih);
  }
}
