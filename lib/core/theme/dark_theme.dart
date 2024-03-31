import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/core/theme/color_palette.dart';
import 'package:store_admin_app/core/theme/extentions/boxshadow_extention.dart';
import 'package:store_admin_app/core/theme/extentions/color_extention.dart';
import 'package:store_admin_app/core/theme/extentions/space_extention.dart';
import 'package:store_admin_app/core/theme/extentions/typograpy_extention.dart';

part 'dark_theme.g.dart';

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: [
    AppColorExtension(
      primary: AppColorPalettes.red400,
      secondary: AppColorPalettes.grey1000,
      text: AppColorPalettes.white500,
      textInverse: AppColorPalettes.blue900,
      textSubtle: AppColorPalettes.gray300,
      textSubtlest: AppColorPalettes.grey400,
      textDisabled: AppColorPalettes.grey350,
      bottomNavBorder: AppColorPalettes.grey350.withOpacity(0.2),
    ),
    AppSpaceExtension.fromBaseSpace(8),
    AppTypographyExtension.fromColors(
      defaultFontColor: AppColorPalettes.white500,
      linkColor: Colors.blue,
      dimFontColor: AppColorPalettes.grey400,
    ),
    AppBoxShadowExtension(
      primary: BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        color: Colors.grey.withOpacity(1),
      ),
      secondary: BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        color: Colors.grey.withOpacity(1),
      ),
    )
  ],
);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darkTheme;
}
