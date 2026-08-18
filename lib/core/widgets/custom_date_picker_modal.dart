import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../app_themes/themes/app_themes.dart';
import 'custom_button.dart';

class CustomDatePickerModal extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final String? helpText;

  const CustomDatePickerModal({
    super.key,
    this.initialDate,
    this.minDate,
    this.maxDate,
    this.helpText,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    String? helpText,
  }) async {
    return await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomDatePickerModal(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
        helpText: helpText,
      ),
    );
  }

  @override
  State<CustomDatePickerModal> createState() => _CustomDatePickerModalState();
}

class _CustomDatePickerModalState extends State<CustomDatePickerModal> {
  late DateTime _currentMonth;
  late DateTime _selectedDate;
  late DateTime _minDate;
  late DateTime _maxDate;

  final List<String> _weekDays = ['Mg', 'Sn', 'Sl', 'Rb', 'Km', 'Jm', 'Sb'];
  final List<String> _fullWeekDays = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];
  final List<String> _months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ]; // ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDate = widget.initialDate ?? now;
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);
    _minDate = widget.minDate ?? DateTime(1900);
    _maxDate = widget.maxDate ?? DateTime(2100);
  }

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _showYearPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Pilih Tahun',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.zn800),
          ),
          content: SizedBox(
            width: 300,
            height: 300,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(primary: AppColors.primary),
              ),
              child: YearPicker(
                firstDate: _minDate,
                lastDate: _maxDate,
                selectedDate: _currentMonth,
                onChanged: (DateTime dateTime) {
                  Navigator.pop(context);
                  setState(() {
                    _currentMonth = DateTime(dateTime.year, _currentMonth.month);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.zn200,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // Optional Help Text (Title)
              if (widget.helpText != null) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.helpText!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.zn500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],

              // Selected Date Header
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${_fullWeekDays[_selectedDate.weekday - 1]}, ${_selectedDate.day} ${_months[_selectedDate.month - 1]} ${_selectedDate.year}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.zn900,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.zn200),
              const SizedBox(height: 16),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _previousMonth,
                    icon: const Icon(
                      LucideIcons.chevronLeft,
                      color: AppColors.zn800,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.zn50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: _showYearPicker,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_months[_currentMonth.month - 1]} ${_currentMonth.year}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.zn800,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(LucideIcons.chevronDown, size: 18, color: AppColors.zn800),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _nextMonth,
                    icon: const Icon(
                      LucideIcons.chevronRight,
                      color: AppColors.zn800,
                      size: 20,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.zn50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Weekdays
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _weekDays.map((day) {
                  return Expanded(
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.zn500,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),

              // Calendar Grid
              _buildCalendarGrid(),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Batal',
                      type: ButtonType.outline,
                      onPressed: () => Navigator.pop(context),
                      isFullWidth: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      label: 'Pilih Tanggal',
                      type: ButtonType.primary,
                      onPressed: () => Navigator.pop(context, _selectedDate),
                      isFullWidth: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateUtils.getDaysInMonth(
      _currentMonth.year,
      _currentMonth.month,
    );
    final firstDayOffset = DateTime(_currentMonth.year, _currentMonth.month, 1).weekday % 7; // 0 for Sunday

    final totalCells = daysInMonth + firstDayOffset;
    final totalWeeks = (totalCells / 7).ceil();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: totalWeeks * 7,
      itemBuilder: (context, index) {
        if (index < firstDayOffset || index >= firstDayOffset + daysInMonth) {
          return const SizedBox.shrink();
        }

        final i = index - firstDayOffset + 1;
        final date = DateTime(_currentMonth.year, _currentMonth.month, i);
        final isSelected = _selectedDate.year == date.year && _selectedDate.month == date.month && _selectedDate.day == date.day;

        final isToday = DateTime.now().year == date.year && DateTime.now().month == date.month && DateTime.now().day == date.day;

        final isBeforeMin = date.isBefore(
          DateTime(_minDate.year, _minDate.month, _minDate.day),
        );
        final isAfterMax = date.isAfter(
          DateTime(_maxDate.year, _maxDate.month, _maxDate.day),
        );
        final isDisabled = isBeforeMin || isAfterMax;

        return GestureDetector(
          onTap: isDisabled
              ? null
              : () {
                  setState(() {
                    _selectedDate = date;
                  });
                },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: isToday && !isSelected ? Border.all(color: AppColors.primary, width: 1.5) : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '$i',
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected || isToday ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? Colors.white
                    : isDisabled
                    ? AppColors.zn300
                    : AppColors.zn800,
              ),
            ),
          ),
        );
      },
    );
  }
}
