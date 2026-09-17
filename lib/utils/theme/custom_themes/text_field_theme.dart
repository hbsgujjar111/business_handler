import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextFormFieldTheme {
  KTextFormFieldTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
    prefixIconColor: KColors.neutralSwatch.shade900,
    suffixIconColor: KColors.neutralSwatch.shade900,
    suffixIconConstraints: BoxConstraints(minWidth: 24),
    prefixIconConstraints: BoxConstraints(minWidth: 24),
    labelStyle: TextStyle(
      color: KColors.textPrimary,
      fontFamily: _currentFont,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),
    hintStyle: TextStyle(
      color: KColors.primarySwatch.shade800.withValues(alpha: .4),
      fontFamily: _currentFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, color: KColors.error),
    filled: false,
    focusColor: KColors.kWhite,
    hoverColor: KColors.kWhite,
    border: const UnderlineInputBorder().copyWith(borderSide: const BorderSide(width: 1, color: KColors.primary)),
    enabledBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.primary),
    ),
    focusedBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.primary),
    ),
    errorBorder: const UnderlineInputBorder().copyWith(borderSide: const BorderSide(width: 1, color: KColors.error)),
    focusedErrorBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.error),
    ),
  );

  /// Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
    prefixIconColor: KColors.neutralSwatch.shade400,
    suffixIconColor: KColors.neutralSwatch.shade400,
    suffixIconConstraints: BoxConstraints(minWidth: 24),
    prefixIconConstraints: BoxConstraints(minWidth: 24),
    labelStyle: TextStyle(
      color: KColors.textPrimary,
      fontFamily: _currentFont,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),
    hintStyle: TextStyle(
      color: KColors.neutralSwatch.shade200.withValues(alpha: .4),
      fontFamily: _currentFont,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal, color: KColors.error),
    filled: true,
    fillColor: KColors.darkContainer,
    focusColor: KColors.darkContainer,
    hoverColor: KColors.darkContainer,
    border: const UnderlineInputBorder().copyWith(borderSide: const BorderSide(width: 1, color: KColors.primary)),
    enabledBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.primary),
    ),
    focusedBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.primary),
    ),
    errorBorder: const UnderlineInputBorder().copyWith(borderSide: const BorderSide(width: 1, color: KColors.error)),
    focusedErrorBorder: const UnderlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1, color: KColors.error),
    ),
  );
}
