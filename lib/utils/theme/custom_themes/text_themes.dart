import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextTheme {
  KTextTheme._();

  /// a private static getter to check the font family
  // static String get _currentFont {
  //   final isUrdu = LocaleSettings.currentLocale == AppLocale.ur;
  //   return isUrdu ? "JameelNoori" : "Flame";
  // }

  /// Light Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: "FlameSans",
      color: KColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "FlameSans",
      color: KColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: "FlameSans",
      color: KColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: "FlameSans",
      color: KColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textPrimary,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    labelSmall: const TextStyle().copyWith(
      fontFamily: "FlameSans",
      color: KColors.textPrimary,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
  );

  /// Dark Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 32.0,
      fontWeight: FontWeight.w800,
      height: 1.2,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    titleLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ),
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
    titleMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    bodySmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 1.5,
    ),
    labelLarge: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    labelSmall: const TextStyle().copyWith(
      fontFamily: "Flame",
      color: KColors.textWhite,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
  );

  static TextStyle snackBarTextStyle = TextStyle(
    color: KColors.kWhite,
    fontSize: 15,
    fontFamily: "Flame",
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
}
