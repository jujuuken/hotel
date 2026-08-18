class NumericHelper {
  static int hitungString(
    String? nilai1,
    String? nilai2, {
    bool selisih = false,
  }) {
    final int angka1 = int.tryParse(nilai1 ?? '') ?? 0;
    final int angka2 = int.tryParse(nilai2 ?? '') ?? 0;
    if (selisih) {
      return angka1 - angka2;
    }
    return angka1 + angka2;
  }
}
