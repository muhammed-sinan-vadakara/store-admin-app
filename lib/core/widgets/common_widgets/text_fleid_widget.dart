import 'package:flutter/material.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hinttText;
  final TextEditingController controller;
  final Widget? prefixxIcon;
  final Widget? suffixxIcon;

  const TextFieldWidget({
    super.key,
    required this.hinttText,
    required this.prefixxIcon,
    this.suffixxIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: AppTheme.of(context).colors.text,
      ),
      controller: controller,
      cursorColor: AppTheme.of(context).colors.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_250,
          vertical: AppTheme.of(context).spaces.space_200,
        ),
        hintText: hinttText,
        hintStyle: TextStyle(
          color: AppTheme.of(context).colors.textInverse,
        ),
        suffixIcon: suffixxIcon,
        prefixIcon: prefixxIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppTheme.of(context).colors.textSubtle,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppTheme.of(context).colors.textSubtle,
          ),
        ),
      ),
    );
  }
}
