import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextButtonTheme {
  KTextButtonTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static TextButtonThemeData lightTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.primary,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kTransparent,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.primary,
        fontFamily: _currentFont,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        height: 1.50,
      ),
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
    ),
  );

  /// Dark Theme
  static TextButtonThemeData darkTextButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.primary,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kTransparent,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.primary,
        fontFamily: _currentFont,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
        height: 1.50,
      ),
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
    ),
  );
}
