import 'package:flutter/material.dart';

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
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintText: hinttText,
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: suffixxIcon,
        prefixIcon: prefixxIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
