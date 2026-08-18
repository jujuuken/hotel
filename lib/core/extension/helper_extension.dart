part of 'extensions.dart';

extension NumGap on num {
  Widget get gap => SizedBox(width: toDouble(), height: toDouble());

  Widget get vGap => SizedBox(height: toDouble());

  Widget get hGap => SizedBox(width: toDouble());
}

enum TransactionStatus { pending, success, failed }

extension TransactionStatusX on TransactionStatus {
  Color get color {
    switch (this) {
      case TransactionStatus.pending:
        return Colors.orange;
      case TransactionStatus.success:
        return Colors.green;
      case TransactionStatus.failed:
        return Colors.red;
    }
  }

  String get label {
    switch (this) {
      case TransactionStatus.pending:
        return 'Menunggu Pembayaran';
      case TransactionStatus.success:
        return 'Berhasil';
      case TransactionStatus.failed:
        return 'Gagal';
    }
  }
}

extension StatusExtension on dynamic {
  String get _asString => '$this';

  bool get isApproved => _asString == '2';

  bool get isPending => _asString == '1';

  bool get isRejected => _asString == '0';

  Color get toColor {
    if (isApproved) return Colors.green;
    if (isPending) return Colors.orange;
    if (isRejected) return Colors.red;
    return Colors.black;
  }
}

extension StringX on String? {
  String get orDash => (this == null || this!.isEmpty || this == '') ? '-' : this!;
}

extension RoutePath on String {
  String get toPath => '/$this';
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeEmptyValues() {
    return this
      ..removeWhere(
            (key, value) => value == null || (value is String && value.trim().isEmpty),
      );
  }

  /// Mengambil value dari Map bersarang (nested map) menggunakan path yang dipisahkan titik.
  /// Contoh: map.getValue('data.nested.value')
  dynamic getValue(String keyPath) {
    final keys = keyPath.split('.');
    dynamic current = this;

    for (final key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }

    return current;
  }
}

extension MapGenericExtension<K, V> on Map<K, V> {
  /// Mengambil value berdasarkan key dengan aman.
  /// Jika key null atau tidak ditemukan, akan mengembalikan [defaultValue].
  V getOrDefault(K? key, V defaultValue) {
    if (key == null || !containsKey(key)) return defaultValue;
    return this[key] as V;
  }
}

extension MapStringValueExtension<K> on Map<K, String> {
  /// Mengambil string/label dari static Map.
  /// Otomatis mengembalikan '-' atau nilai [fallback] jika key tidak ditemukan.
  String getName(K? key, {String fallback = '-'}) {
    if (key == null || !containsKey(key)) return fallback;
    return this[key] ?? fallback;
  }
}

extension DateTimeNameGenerator on DateTime {
  /// Menghasilkan nama file standar: YYYYMMDD (Contoh: 20260607)
  String toDateName() {
    return DateFormat('yyyyMMdd').format(this);
  }

  /// Menghasilkan nama dengan prefix custom (Contoh: IMG_20260607)
  String toPrefixName(String prefix) {
    return '${prefix}_${toDateName()}';
  }

  /// Contoh: FILE_20260607_161136
  String toFileNameTimestamp({String prefix = 'FILE'}) {
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(this);
    return '${prefix}_$timestamp';
  }
}

extension StringNameGenerator on String {
  /// Contoh: "pdf_file".withTodayDate() -> pdf_file_20260607
  String withTodayDate({String separator = '_'}) {
    final today = DateFormat('yyyyMMdd').format(DateTime.now());
    return '$this$separator$today';
  }

  /// Contoh: "slip".withTodayTimestamp() -> slip_20260607_161136.pdf
  String withTodayTimestamp({String separator = '_', String extension = ''}) {
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final ext = extension.isNotEmpty ? '.$extension' : '';
    return '$this$separator$timestamp$ext';
  }
}

extension DateStringFormatter on String {
  /// Core parsing logic that tries multiple formats. Returns null if all fail.
  DateTime? toDateTimeOrNull() {
    String dateStr = this;

    // Handle YYYY-MM (e.g., "2026-07")
    if (dateStr.length == 7 && dateStr.contains('-')) {
      dateStr = '$dateStr-01';
    }

    // Try standard Dart DateTime parsing (handles YYYY-MM-DD, ISO-8601, dll)
    DateTime? parsed = DateTime.tryParse(dateStr);
    if (parsed != null) return parsed;

    // Try parsing Indonesian format "dd MMMM yyyy" (e.g., "20 Juli 2024")
    try {
      return DateFormat('dd MMMM yyyy', 'id_ID').parse(this);
    } catch (_) {}

    // Try parsing Indonesian format "MMMM yyyy" (e.g., "Juli 2024")
    try {
      return DateFormat('MMMM yyyy', 'id_ID').parse(this);
    } catch (_) {}

    // Try parsing "dd-MM-yyyy"
    try {
      return DateFormat('dd-MM-yyyy').parse(this);
    } catch (_) {}

    // Try parsing "dd/MM/yyyy"
    try {
      return DateFormat('dd/MM/yyyy').parse(this);
    } catch (_) {}

    return null;
  }

  /// Converts various date formats to "20 Juli 2024"
  String toReadableDate() {
    final date = toDateTimeOrNull();
    if (date == null) return this;
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  /// Converts various date formats to "Juli 2024"
  String toReadableMonthYear() {
    final date = toDateTimeOrNull();
    if (date == null) return this;
    return DateFormat('MMMM yyyy', 'id_ID').format(date);
  }

  /// Converts various date formats to "15:30"
  String toReadableTime() {
    final date = toDateTimeOrNull();
    if (date == null) return this;
    return DateFormat('HH:mm').format(date);
  }

  /// Converts various date formats back to "2024-07-20"
  String toIsoDate() {
    final date = toDateTimeOrNull();
    if (date == null) return this;
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Converts various date formats back to "2024-07"
  String toIsoMonthYear() {
    final date = toDateTimeOrNull();
    if (date == null) return this;
    return DateFormat('yyyy-MM').format(date);
  }

  /// Robustly converts string to DateTime, fallbacks to DateTime.now() if failed.
  DateTime toDateTime() {
    return toDateTimeOrNull() ?? DateTime.now();
  }
}

extension DateTimeFormatter on DateTime {
  String toIsoDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toIsoMonthYear() {
    return DateFormat('yyyy-MM').format(this);
  }
}

extension CurrencyFormatter on String {
  /// Converts string to Rupiah format, e.g., "20000" -> "Rp20.000"
  /// If the string contains any letters, returns "Rp0".
  String toCurrency() {
    if (RegExp(r'[a-zA-Z]').hasMatch(this)) {
      return 'Rp0';
    }

    try {
      final cleanString = replaceAll(RegExp(r'[^0-9]'), '');
      if (cleanString.isEmpty) return 'Rp0';

      final number = int.parse(cleanString);
      final formatter = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      return formatter.format(number);
    } catch (e) {
      return 'Rp0';
    }
  }

  /// Removes Rupiah formatting, e.g., "Rp20.000" -> "20000"
  String removeCurrency() {
    final cleanString = replaceAll(RegExp(r'[^0-9]'), '');
    return cleanString.isEmpty ? '0' : cleanString;
  }
}

extension DurationFormatter on String {
  /// Converts string representing total minutes like "100" to "1 Jam 40 Menit", "1500" to "1 Hari 1 Jam"
  String toDuration() {
    final totalMinutes = int.tryParse(trim()) ?? 0;
    if (totalMinutes == 0) return '0 Menit';

    final days = totalMinutes ~/ 1440;
    final remainingMinutesAfterDays = totalMinutes % 1440;
    final hours = remainingMinutesAfterDays ~/ 60;
    final minutes = remainingMinutesAfterDays % 60;

    List<String> parts = [];
    if (days > 0) parts.add('$days Hari');
    if (hours > 0) parts.add('$hours Jam');
    if (minutes > 0) parts.add('$minutes Menit');

    return parts.join(' ');
  }
}
