import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../app_themes/themes/app_themes.dart';
import 'custom_button.dart';

class CustomMonthYearPickerModal extends StatefulWidget {
  final DateTime initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;

  const CustomMonthYearPickerModal({
    super.key,
    required this.initialDate,
    this.minDate,
    this.maxDate,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    return await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomMonthYearPickerModal(
        initialDate: initialDate,
        minDate: minDate,
        maxDate: maxDate,
      ),
    );
  }

  @override
  State<CustomMonthYearPickerModal> createState() => _CustomMonthYearPickerModalState();
}

class _CustomMonthYearPickerModalState extends State<CustomMonthYearPickerModal> {
  late DateTime _selectedDate;

  final List<String> _monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate = DateTime(_selectedDate.year - 1, _selectedDate.month);
                      });
                    },
                    icon: const Icon(LucideIcons.chevronLeft, color: AppColors.zn800, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.zn50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Text(
                    '${_selectedDate.year}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.zn800),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate = DateTime(_selectedDate.year + 1, _selectedDate.month);
                      });
                    },
                    icon: const Icon(LucideIcons.chevronRight, color: AppColors.zn800, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.zn50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(color: AppColors.zn200),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.6,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  final monthNum = index + 1;
                  final isSelected = _selectedDate.month == monthNum;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime(_selectedDate.year, monthNum);
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : AppColors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.zn200,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        _monthNames[index],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? AppColors.white : AppColors.zn700,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
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
                      label: 'Pilih',
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
}

Future<DateTime?> showMonthYearPicker({
  required BuildContext context,
  required DateTime initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  return await CustomMonthYearPickerModal.show(
    context: context,
    initialDate: initialDate,
    minDate: firstDate,
    maxDate: lastDate,
  );
}
