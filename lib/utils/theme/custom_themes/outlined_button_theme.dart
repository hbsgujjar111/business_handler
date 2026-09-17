import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KOutlinedButtonTheme {
  KOutlinedButtonTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static OutlinedButtonThemeData lightOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.primary,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kGrey,
      side: const BorderSide(color: KColors.borderPrimary),
      iconSize: 24.0,
      iconColor: KColors.primarySwatch.shade800,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.kWhite,
        fontFamily: _currentFont,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ),
  );

  /// Dark Theme
  static OutlinedButtonThemeData darkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kWhite,
      backgroundColor: KColors.kTransparent,
      disabledForegroundColor: KColors.kGrey,
      disabledBackgroundColor: KColors.kGrey,
      side: const BorderSide(color: KColors.borderPrimary),
      iconSize: 24,
      iconColor: KColors.neutralSwatch.shade50,
      fixedSize: const Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.kWhite,
        fontFamily: _currentFont,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
  );
}
