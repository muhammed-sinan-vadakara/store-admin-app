import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/core/theme/color_palette.dart';
import 'package:store_admin_app/core/theme/extentions/boxshadow_extention.dart';
import 'package:store_admin_app/core/theme/extentions/color_extention.dart';
import 'package:store_admin_app/core/theme/extentions/space_extention.dart';
import 'package:store_admin_app/core/theme/extentions/typograpy_extention.dart';

part 'light_theme.g.dart';

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.red400,
      secondary: AppColorPalettes.white500,
      text: AppColorPalettes.blue900,
      textInverse: AppColorPalettes.gray200,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.blue900,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
    AppBoxShadowExtension(
        primary: BoxShadow(
          blurRadius: 34,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.1),
        ),
        secondary: BoxShadow(
          blurRadius: 20,
          spreadRadius: -10,
          color: Colors.black.withOpacity(0.2),
        ))
  ],
);

@riverpod
ThemeData lightTheme(LightThemeRef ref) {
  return _lightTheme;
}
