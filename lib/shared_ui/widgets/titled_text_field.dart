import 'package:flutter/material.dart';
import '../app_themes/themes/app_themes.dart';
import 'custom_text_form_field.dart';

class TitledTextField extends StatelessWidget {
  const TitledTextField({
    super.key,
    required this.title,
    this.controller,
    this.hint,
    this.isReq = false,
    this.enabled = true,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.icon,
    this.onChanged,
    this.maxLines = 1,
    this.fieldType = FormFieldType.text,
  });

  final String title;
  final TextEditingController? controller;
  final String? hint;
  final bool isReq;
  final bool enabled;
  final VoidCallback? onTap;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Widget? icon;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final FormFieldType fieldType;

  Widget? _buildPrefixWidget() {
    if (icon != null) {
      if (icon is Icon) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            (icon as Icon).icon,
            size: 22,
            color: (icon as Icon).color,
          ),
        );
      }
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Icon(Icons.circle, size: 22),
      );
    } else if (prefixIcon != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(prefixIcon, size: 22),
      );
    }
    return null;
  }

  Widget? _buildSuffixWidget() {
    if (suffixIcon != null) {
      if (onTap != null) {
        return IconButton(
          onPressed: onTap,
          icon: Icon(suffixIcon, size: 22),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(suffixIcon, size: 22),
      );
    } else if (onTap != null) {
      return IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_drop_down, size: 22),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.zn800,
              ),
            ),
            if (isReq)
              const Text(
                ' *',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
        const SizedBox(height: 6),
        CustomTextFormField(
          controller: controller,
          hintText: hint,
          fieldType: fieldType,
          readOnly: onTap != null,
          enabled: enabled,
          onTap: onTap,
          onChanged: onChanged,
          maxLines: maxLines,
          isRequired: isReq,
          prefixIcon: _buildPrefixWidget(),
          suffixIcon: _buildSuffixWidget(),
        ),
      ],
    );
  }
}
