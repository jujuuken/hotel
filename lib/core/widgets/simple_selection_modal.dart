import 'package:flutter/material.dart';

import '../app_themes/themes/app_themes.dart';
import 'custom_bottom_sheet.dart';

class SimpleSelectionModal<T> extends StatelessWidget {
  final String title;
  final Map<T, String> items;
  final T? selectedValue;

  const SimpleSelectionModal({
    super.key,
    required this.title,
    required this.items,
    this.selectedValue,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Map<T, String> items,
    T? selectedValue,
    bool expand = false,
  }) {
    return CustomBottomSheet.show<T>(
      context: context,
      title: title,
      expand: expand,
      content: SimpleSelectionList<T>(
        items: items,
        selectedValue: selectedValue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: AppColors.zn300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.zn800,
                  ),
                ),
              ),
            ),
            const Divider(color: AppColors.divider),
            Flexible(
              child: SimpleSelectionList<T>(
                items: items,
                selectedValue: selectedValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleSelectionList<T> extends StatelessWidget {
  final Map<T, String> items;
  final T? selectedValue;

  const SimpleSelectionList({
    super.key,
    required this.items,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final key = items.keys.elementAt(index);
        final value = items.values.elementAt(index);
        final isSelected = key == selectedValue;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.pop(context, key),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Theme.of(context).primaryColor : AppColors.divider,
                ),
                borderRadius: BorderRadius.circular(12),
                color: isSelected ? Theme.of(context).primaryColor.withValues(alpha: 0.05) : Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Theme.of(context).primaryColor : AppColors.zn800,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
