import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;

import '../app_themes/themes/app_themes.dart';

enum FormFieldType {
  text,
  number,
  numberDouble,
  email,
  password,
  phoneNumber,
  nik,
  nip,
  currency,
  masaKerjaBulan,
  onlyText,
  onlyNumber,
  masaKerjaTahun;

  bool get isPassword => this == FormFieldType.password;

  // Memindahkan logika Regex Emoji ke satu tempat
  static final TextInputFormatter denyEmoji = FilteringTextInputFormatter.deny(
    RegExp(
      r'[\u{1F600}-\u{1F64F}'
      r'\u{1F300}-\u{1F5FF}'
      r'\u{1F680}-\u{1F6FF}'
      r'\u{1F1E0}-\u{1F1FF}'
      r'\u{2600}-\u{26FF}'
      r'\u{2700}-\u{27BF}'
      r'\u{FE00}-\u{FE0F}'
      r'\u{1F900}-\u{1F9FF}'
      r'\u{1F018}-\u{1F270}'
      r'\u{238C}-\u{2454}'
      r']',
      unicode: true,
    ),
  );
}

class CustomTextFormField extends StatefulWidget {
  final FormFieldType fieldType;
  final TextEditingController? controller;
  final String? hintText;
  final bool readOnly;
  final bool enabled;
  final bool isRequired;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final AutovalidateMode autoValidateMode;
  final int minLines;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    this.fieldType = FormFieldType.text, // Default ke text
    this.controller,
    this.hintText,
    this.readOnly = false,
    this.enabled = true,
    this.isRequired = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType,
    this.autoValidateMode = AutovalidateMode.onUnfocus,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.focusNode,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.fieldType.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final config = _FieldConfig.get(widget.fieldType, widget.isRequired);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      obscureText: _obscureText,
      autovalidateMode: widget.autoValidateMode,
      keyboardType: widget.keyboardType ?? config.keyboardType,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.fieldType.isPassword ? 1 : widget.maxLines,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      validator: config.validator,
      inputFormatters: config.formatters,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText ?? '',
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: _buildSuffixIcon(),
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget? _buildPrefixIcon() {
    return widget.prefixIcon;
  }

  Widget? _buildSuffixIcon() {
    // Jika password, prioritaskan toggle visibility
    if (widget.fieldType.isPassword) {
      return IconButton(
        onPressed: () => setState(() => _obscureText = !_obscureText),
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 22,
        ),
      );
    }

    if (widget.suffixIcon == null) {
      if (widget.readOnly && widget.onTap != null) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 22,
            color: AppColors.zn400,
          ),
        );
      }
      return null;
    }
    
    return widget.suffixIcon;
  }
}

class _FieldConfig {
  final List<TextInputFormatter> formatters;
  final String? Function(String?) validator;
  final TextInputType keyboardType;

  _FieldConfig({
    required this.formatters,
    required this.validator,
    this.keyboardType = TextInputType.text,
  });

  static _FieldConfig get(FormFieldType type, bool isRequired) {
    switch (type) {
      case FormFieldType.phoneNumber:
        return _FieldConfig(
          keyboardType: TextInputType.phone,
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))],
          validator: (value) {
            if (!isRequired) return null;
            if (value == null || value.isEmpty) return 'Nomor HP tidak boleh kosong';
            if (!value.startsWith('08') || value.length < 10 || value.length > 13) {
              return 'Masukkan nomor HP yang valid';
            }
            return null;
          },
        );

      case FormFieldType.nip:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
          validator: (value) {
            if (!isRequired) return null;
            if (value == null || value.isEmpty) return 'NIP tidak boleh kosong';
            if (value.length < 16 || value.length > 18) return 'Masukkan NIP yang valid';
            return null;
          },
        );

      case FormFieldType.nik:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
          validator: (value) {
            if (!isRequired) return null;
            if (value == null || value.isEmpty) return 'NIK tidak boleh kosong';
            if (value.length < 16 || value.length > 18) return 'Masukkan NIK yang valid';
            return null;
          },
        );

      case FormFieldType.email:
        return _FieldConfig(
          keyboardType: TextInputType.emailAddress,
          formatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<> ]'),
            ),
          ],
          validator: (value) {
            if (!isRequired) return null;
            if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
            if (!RegExp(
              r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
            ).hasMatch(value)) {
              return 'Masukkan email yang valid';
            }
            return null;
          },
        );

      case FormFieldType.onlyText:
        return _FieldConfig(
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      case FormFieldType.onlyNumber:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]'))],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      case FormFieldType.numberDouble:
        return _FieldConfig(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          formatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      case FormFieldType.currency:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [
            FilteringTextInputFormatter.digitsOnly,
            _CurrencyInputFormatter(
              maxValue: BigInt.from(100000000),
              minValue: BigInt.from(0),
              allowDecimal: false,
            ),
          ],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      case FormFieldType.masaKerjaBulan:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [
            FilteringTextInputFormatter.digitsOnly,
            _MaxValueInputFormatter(12),
          ],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      case FormFieldType.masaKerjaTahun:
        return _FieldConfig(
          keyboardType: TextInputType.number,
          formatters: [
            FilteringTextInputFormatter.digitsOnly,
            _MaxValueInputFormatter(60),
          ],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );

      default:
        return _FieldConfig(
          formatters: [FormFieldType.denyEmoji],
          validator: (value) =>
              isRequired && (value == null || value.isEmpty) ? 'Harus diisi, tidak boleh kosong' : null,
        );
    }
  }
}

class _MaxValueInputFormatter extends TextInputFormatter {
  final int max;

  _MaxValueInputFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      return newValue.copyWith(text: '');
    }

    int value = int.parse(digitsOnly);
    if (value > max) {
      value = max;
    }

    return TextEditingValue(
      text: value.toString(),
      selection: TextSelection.collapsed(offset: value.toString().length),
    );
  }
}

class _CurrencyInputFormatter extends TextInputFormatter {
  final intl.NumberFormat _currencyFormatter;
  final BigInt? maxValue;
  final BigInt? minValue;
  final bool allowDecimal;
  final int decimalDigits;

  _CurrencyInputFormatter({
    String locale = 'id_ID',
    String symbol = 'Rp',
    this.decimalDigits = 0,
    this.maxValue,
    // ignore: unused_element_parameter
    this.minValue,
    // ignore: unused_element_parameter
    this.allowDecimal = false,
  }) : _currencyFormatter = intl.NumberFormat.currency(
         locale: locale,
         symbol: symbol,
         decimalDigits: decimalDigits,
       );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Jika teks baru kosong, kembalikan nilai kosong
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Ekstrak angka dari input
    final regex = allowDecimal ? RegExp(r'[^0-9.]') : RegExp(r'[^0-9]');
    String digitsOnly = newValue.text.replaceAll(regex, '');

    // Handle kasus dimana hanya titik desimal yang diinput
    if (digitsOnly == '.') return oldValue;

    // Handle multiple decimal points
    if (allowDecimal) {
      final decimalPoints = digitsOnly.split('.').length - 1;
      if (decimalPoints > 1) {
        digitsOnly =
            digitsOnly.substring(0, digitsOnly.lastIndexOf('.')) +
            digitsOnly.substring(digitsOnly.lastIndexOf('.') + 1);
      }
    }

    // Jika tidak ada angka, kembalikan nilai kosong
    if (digitsOnly.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Parse nilai
    BigInt value;
    if (allowDecimal) {
      // Untuk nilai desimal, kita akan memproses sebagai integer dengan mempertimbangkan digits desimal
      final parts = digitsOnly.split('.');
      final wholePart = parts[0];
      final decimalPart = parts.length > 1 ? parts[1] : '';

      // Batasi digit desimal
      final limitedDecimalPart = decimalPart.length > decimalDigits
          ? decimalPart.substring(0, decimalDigits)
          : decimalPart;

      value = BigInt.parse(
        wholePart + limitedDecimalPart.padRight(decimalDigits, '0'),
      );
    } else {
      value = BigInt.parse(digitsOnly);
    }

    // Validasi range nilai
    if (maxValue != null && value > maxValue!) {
      value = maxValue!;
    }
    if (minValue != null && value < minValue!) {
      value = minValue!;
    }

    // Format nilai
    String formatted;
    if (allowDecimal) {
      // Untuk nilai desimal, kita perlu membagi kembali nilai yang sudah diparse
      final valueString = value.toString().padLeft(decimalDigits + 1, '0');
      final wholePart = valueString.substring(
        0,
        valueString.length - decimalDigits,
      );
      final decimalPart = valueString.substring(
        valueString.length - decimalDigits,
      );

      formatted = _currencyFormatter.format(
        double.parse('$wholePart.$decimalPart'),
      );
    } else {
      formatted = _currencyFormatter.format(value.toInt());
    }

    // Pertahankan posisi kursor yang benar
    final offset = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }

  /// Method untuk mendapatkan nilai numerik dari teks yang di-format
  BigInt getNumericValue(String formattedText) {
    final cleanText = formattedText
        .replaceAll(_currencyFormatter.currencySymbol, '')
        .replaceAll(RegExp(r'[^0-9.]'), '');

    if (cleanText.isEmpty) return BigInt.zero;

    if (allowDecimal) {
      final parts = cleanText.split('.');
      final wholePart = parts[0];
      final decimalPart = parts.length > 1 ? parts[1] : '0';
      return BigInt.parse(wholePart + decimalPart.padRight(decimalDigits, '0'));
    } else {
      return BigInt.parse(cleanText);
    }
  }

  /// Method untuk memformat nilai BigInt ke string mata uang
  String formatBigInt(BigInt value) {
    if (allowDecimal) {
      final valueString = value.toString().padLeft(decimalDigits + 1, '0');
      final wholePart = valueString.substring(
        0,
        valueString.length - decimalDigits,
      );
      final decimalPart = valueString.substring(
        valueString.length - decimalDigits,
      );
      return _currencyFormatter.format(double.parse('$wholePart.$decimalPart'));
    } else {
      return _currencyFormatter.format(value.toInt());
    }
  }
}
