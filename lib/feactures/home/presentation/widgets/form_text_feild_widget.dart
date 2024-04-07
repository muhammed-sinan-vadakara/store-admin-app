import 'package:flutter/material.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String? hinttText;
  final TextEditingController controller;
  final Widget? prefixxIcon;
  final Widget? suffixxIcon;
  final dynamic? keyboardtype;
  final dynamic? validator;
  final bool? enabled;

  FormTextFieldWidget(
      {super.key,
      required this.hinttText,
      this.prefixxIcon,
      this.suffixxIcon,
      required this.controller,
      this.enabled,
      this.validator,
      this.keyboardtype});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(
        color: AppTheme.of(context).colors.text,
      ),
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardtype,
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
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                BorderSide(color: AppTheme.of(context).colors.textDisabled)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppTheme.of(context).colors.textSubtle,
          ),
        ),
      ),
    );
    // TextField(
    //   style: TextStyle(
    //     color: AppTheme.of(context).colors.text,
    //   ),
    //   controller: controller,
    //   keyboardType: keyboardtype,
    //   cursorColor: AppTheme.of(context).colors.text,
    //   decoration: InputDecoration(
    //     contentPadding: EdgeInsets.symmetric(
    //       horizontal: AppTheme.of(context).spaces.space_250,
    //       vertical: AppTheme.of(context).spaces.space_200,
    //     ),
    //     hintText: hinttText,
    //     hintStyle: TextStyle(
    //       color: AppTheme.of(context).colors.textInverse,
    //     ),
    //     suffixIcon: suffixxIcon,
    //     prefixIcon: prefixxIcon,
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(20),
    //       borderSide: BorderSide(
    //         color: AppTheme.of(context).colors.textSubtle,
    //       ),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(20),
    //       borderSide: BorderSide(
    //         color: AppTheme.of(context).colors.textSubtle,
    //       ),
    //     ),
    //   ),
    // );
  }
}
