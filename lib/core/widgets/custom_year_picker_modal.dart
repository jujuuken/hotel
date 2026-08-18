import 'package:flutter/material.dart';

class CustomYearPickerModal {
  static Future<int?> show({
    required BuildContext context,
    int? initialYear,
    int? minYear,
    int? maxYear,
    String title = 'Pilih Tahun',
  }) async {
    final currentYear = DateTime.now().year;
    final start = minYear ?? (currentYear - 50);
    final end = maxYear ?? (currentYear + 20);

    return showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(start),
              lastDate: DateTime(end),
              selectedDate: DateTime(initialYear ?? currentYear),
              onChanged: (DateTime dateTime) {
                Navigator.pop(context, dateTime.year);
              },
            ),
          ),
        );
      },
    );
  }
}
