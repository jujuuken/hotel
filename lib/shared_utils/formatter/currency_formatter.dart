import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatCurrency(String? value) {
    if (value == null || value.isEmpty) return 'Rp 0';

    final number =
        double.tryParse(value.replaceAll(RegExp(r'[^0-9.-]'), '')) ?? 0.0;

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: (number % 1 == 0) ? 0 : 2,
    );

    return formatter.format(number);
  }

  static String removeFormatCurrency(String? formattedValue) {
    if (formattedValue == null || formattedValue.isEmpty) {
      return '0';
    }

    final String withoutThousandsSeparator = formattedValue.replaceAll('.', '');
    final String withDecimalPoint = withoutThousandsSeparator.replaceAll(
      ',',
      '.',
    );
    final String numericString = withDecimalPoint.replaceAll(
      RegExp(r'[^\d.-]'),
      '',
    );

    if (numericString.isEmpty) {
      return '0';
    }

    return numericString;
  }
}
