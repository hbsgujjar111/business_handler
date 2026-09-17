import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KChipTheme {
  KChipTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: TextStyle(color: KColors.kBlack, fontFamily: _currentFont),
    selectedColor: KColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: KColors.kWhite,
  );

  /// Dark Theme
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: TextStyle(color: KColors.kBlack, fontFamily: _currentFont),
    selectedColor: KColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: KColors.kWhite,
  );
}
