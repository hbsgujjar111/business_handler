import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KElevatedButtonTheme {
  KElevatedButtonTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static ElevatedButtonThemeData lightElevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: KColors.kWhite,
      backgroundColor: KColors.secondary,
      disabledForegroundColor: KColors.kWhite,
      disabledBackgroundColor: KColors.buttonDisabled,
      iconSize: 24.0,
      iconColor: KColors.neutralSwatch.shade50,
      fixedSize: Size.fromHeight(48),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      textStyle: TextStyle(
        color: KColors.kWhite,
        fontFamily: _currentFont,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.50,
      ),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ),
  );

  /// Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonThemeData = ElevatedButtonThemeData(
    style:
        ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: KColors.kWhite,
          backgroundColor: KColors.secondary,
          disabledForegroundColor: KColors.kWhite,
          disabledBackgroundColor: KColors.buttonDisabled,
          iconSize: 24.0,
          iconColor: KColors.neutralSwatch.shade50,
          fixedSize: Size.fromHeight(48),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          textStyle: TextStyle(
            color: KColors.kWhite,
            fontFamily: _currentFont,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
          shape: RoundedRectangleBorder(borderRadius: .circular(100)),
        ).copyWith(
          backgroundBuilder: (context, states, child) {
            if (states.contains(WidgetState.disabled)) {
              return DecoratedBox(
                decoration: BoxDecoration(color: KColors.buttonDisabled, borderRadius: BorderRadius.circular(100)),
                child: child,
              );
            }

            return DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: KColors.gradientColors,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: child,
            );
          },
        ),
  );
}
