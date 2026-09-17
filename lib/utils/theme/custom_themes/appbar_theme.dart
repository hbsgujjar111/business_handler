import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class KAppBarTheme {
  KAppBarTheme._();

  /// a private static getter to check the font family
  static String get _currentFont {
    return "Flame";
  }

  /// Light Theme
  static var lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: KColors.kTransparent,
    surfaceTintColor: KColors.kTransparent,
    iconTheme: IconThemeData(color: KColors.primarySwatch.shade800, size: 24),
    actionsIconTheme: IconThemeData(color: KColors.primarySwatch.shade800, size: 24),
    titleTextStyle: TextStyle(
      color: KColors.primarySwatch.shade800,
      fontFamily: _currentFont,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.20,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: KColors.kTransparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Dark icons for light mode
      systemNavigationBarColor: KColors.kTransparent, // Optional: set nav bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  /// Dark Theme
  static var darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: KColors.neutralSwatch.shade900,
    surfaceTintColor: KColors.kTransparent,
    iconTheme: const IconThemeData(color: KColors.kWhite, size: 24),
    actionsIconTheme: const IconThemeData(color: KColors.kWhite, size: 24),
    titleTextStyle: TextStyle(
      color: KColors.kWhite,
      fontFamily: _currentFont,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      height: 1.20,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: KColors.kTransparent, // Transparent status bar
      statusBarIconBrightness: Brightness.light, // Dark icons for light mode
      systemNavigationBarColor: KColors.kTransparent, // Optional: set nav bar color
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
