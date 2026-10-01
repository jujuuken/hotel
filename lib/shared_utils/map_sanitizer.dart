extension MapSanitizer on Map<String, dynamic> {
  /// Mengambil String secara aman.
  String str(String key, {String? altKey, String fallback = ''}) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null) return fallback;
    return value.toString();
  }

  /// Mengambil Integer secara aman, menangani String dan Double.
  int i(String key, {String? altKey, int fallback = 0}) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null) return fallback;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? fallback;
    return fallback;
  }

  /// Mengambil Double secara aman.
  double d(String key, {String? altKey, double fallback = 0.0}) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null) return fallback;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? fallback;
    return fallback;
  }

  /// Mengambil Boolean secara aman (mendukung 1/0, "true"/"false", "yes"/"no").
  bool b(String key, {String? altKey, bool fallback = false}) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null) return fallback;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) {
      final v = value.toLowerCase().trim();
      return v == 'true' || v == '1' || v == 'yes' || v == 'ok';
    }
    return fallback;
  }

  /// Mengambil Object Map secara aman dan mengonversinya ke Model.
  T map<T>(
      String key,
      T Function(Map<String, dynamic> json) fromJson, {
        String? altKey,
        required T fallback,
      }) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null || value is! Map<String, dynamic>) return fallback;
    return fromJson(value);
  }

  /// Mengambil List secara aman tanpa pernah takut Null Error saat mapping.
  List<T> list<T>(
      String key,
      T Function(Map<String, dynamic> json) fromJson, {
        String? altKey,
      }) {
    final value = this[key] ?? (altKey != null ? this[altKey] : null);
    if (value == null || value is! List) return [];
    return value
        .whereType<Map<String, dynamic>>() // Memastikan isi list adalah Map
        .map(fromJson)
        .toList();
  }
}
