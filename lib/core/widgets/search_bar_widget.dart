import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../app_themes/themes/app_themes.dart';

class SearchBarWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final VoidCallback? onClear;
  final FocusNode? focusNode;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Cari menu...',
    this.onClear,
    this.focusNode,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _showClear = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _showClear = _controller.text.isNotEmpty;

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    final showClear = _controller.text.isNotEmpty;
    if (showClear != _showClear) {
      setState(() {
        _showClear = showClear;
      });
    }
  }

  void _onFocusChanged() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }

    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChanged);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isFocused ? AppColors.primary : AppColors.zn200,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: _isFocused
                ? AppColors.primary.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        style: AppTextStyle.style14Medium.copyWith(color: AppColors.zn900),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyle.style14Regular.copyWith(
            color: AppColors.hintColor,
          ),
          prefixIcon: Icon(
            LucideIcons.search,
            color: _isFocused ? AppColors.primary : AppColors.hintColor,
            size: 20,
          ),
          suffixIcon: _showClear
              ? IconButton(
                  icon: const Icon(
                    LucideIcons.x,
                    size: 18,
                    color: AppColors.hintColor,
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged?.call('');
                    widget.onClear?.call();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
