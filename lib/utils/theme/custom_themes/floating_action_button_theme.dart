import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class KFloatingActionButtonTheme {
  KFloatingActionButtonTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static FloatingActionButtonThemeData lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: KColors.kWhite,
    backgroundColor: KColors.primary,
    iconSize: KSizes.iconMd,
    extendedIconLabelSpacing: KSizes.spaceBtwItems,
    extendedTextStyle: TextStyle(
      fontSize: 15,
      fontFamily: _currentFont,
      color: KColors.kWhite,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(borderRadius: .circular(12)),
  );

  /// Dark Theme
  static FloatingActionButtonThemeData darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: 0,
    foregroundColor: KColors.kWhite,
    backgroundColor: KColors.primary,
    iconSize: KSizes.iconMd,
    extendedIconLabelSpacing: KSizes.spaceBtwItems,
    extendedTextStyle: TextStyle(
      fontSize: 15,
      fontFamily: _currentFont,
      color: KColors.kWhite,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(borderRadius: .circular(12)),
  );
}
