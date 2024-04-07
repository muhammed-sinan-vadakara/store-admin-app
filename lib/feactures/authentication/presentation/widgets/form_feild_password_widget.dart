import 'package:flutter/material.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';

class PasswordFormTextFieldWidget extends StatefulWidget {
  final String? hinttText;
  final TextEditingController controller;

  final dynamic keyboardtype;
  final dynamic validator;

  const PasswordFormTextFieldWidget(
      {super.key,
      required this.hinttText,
      required this.controller,
      this.validator,
      this.keyboardtype});

  @override
  State<PasswordFormTextFieldWidget> createState() =>
      _PasswordFormTextFieldWidgetState();
}

class _PasswordFormTextFieldWidgetState
    extends State<PasswordFormTextFieldWidget> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      style: TextStyle(
        color: AppTheme.of(context).colors.text,
      ),
      controller: widget.controller,
      keyboardType: widget.keyboardtype,
      cursorColor: AppTheme.of(context).colors.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_250,
          vertical: AppTheme.of(context).spaces.space_200,
        ),
        hintText: widget.hinttText,
        hintStyle: TextStyle(
          color: AppTheme.of(context).colors.textInverse,
        ),
        prefixIcon: InkWell(
          onTap: () {
            setState(() {
              passToggle = !passToggle;
            });
          },
          child: Icon(
            passToggle ? Icons.visibility : Icons.visibility_off,
            color: AppTheme.of(context).colors.primary,
          ),
        ),
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
