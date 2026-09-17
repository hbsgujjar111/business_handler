import 'package:flutter/material.dart';

class KColors {
  KColors._();

  /// App Basic Colors
  // static const Color primary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFF5A61C);
  static const Color neutral = Color(0xFF6E6D6C);

  /// Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF5A61C), Color(0xFFCA2E45)],
  );

  static const List<Color> gradientColors = [Color(0xFFF5A61C), Color(0xFFCA2E45)];

  /// Text Colors
  // static const Color textPrimary = Color(0xFFFFFFFF);
  // static const Color textSecondary = Color(0xFFF5A61C);
  static const Color textWhite = Color(0xffFFFFFF);

  /// Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF282828);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color splashBackground = Color(0xFFFFEBE9);

  /// Background Container Colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static const Color darkContainer = Color(0XFF1A1A1A);

  /// Button Colors

  static const Color buttonPrimary = Color(0xFF2E1723);
  static const Color buttonSecondary = Color(0xFFF5A61C);
  static const Color buttonDisabled = Color(0xFFFFB570);
  static const Color supportButtonColor = Color(0xFF25D366);

  ///  Colors
  static const Color borderPrimary = Color(0xFFFFFFFF);
  static const Color borderSecondary = Color(0xFFF5A61C);

  /// Error and Validation Colors
  static const Color success = Color(0xFF21A649);
  static const Color error = Color(0xFFE81A43);
  static const Color warning = Color(0xFFF2BA00);
  static const Color info = Color(0xFF2196F3);

  /// Neutral Shades
  static const Color kBlack = Color(0xFF232323);
  static const Color darkestGrey = Color(0xff4F4F4F);
  static const Color darkGrey = Color(0xff808080);
  static const Color kGrey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color scaffoldBg = Color(0xff262626);
  static const Color blackColor = Color(0xFF000000);
  static const Color kTransparent = Colors.transparent;

  /// Dark Mode Colors
  static const Color darkModeBg = Color(0xFF0F0F0F);
  static const Color darkModeContainer = Color(0xFF2C2C2C);

  /// swatches
  static const MaterialColor primarySwatch = MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color(0xFFF7F7F7),
    100: Color(0xFFF2F2F2),
    200: Color(0xFFE6E6E6),
    300: Color(0xFFD9D9D9),
    400: Color(0xFFC7C7C7),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFD1D1D1),
    700: Color(0xFFA3A3A3),
    800: Color(0xFF757575),
    900: Color(0xFF4D4D4D),
  });

  static const MaterialColor secondarySwatch = MaterialColor(0xFFF5A61C, <int, Color>{
    50: Color(0xFFFAF5ED),
    100: Color(0xFFF6E9D4),
    200: Color(0xFFF2D9AD),
    300: Color(0xFFF1C77F),
    400: Color(0xFFF3B74E),
    500: Color(0xFFF5A61C),
    600: Color(0xFFD88C07),
    700: Color(0xFFAB6E03),
    800: Color(0xFF7C5001),
    900: Color(0xFF523400),
  });

  static const MaterialColor neutralSwatch = MaterialColor(0xFFB3AAA6, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFF7F5F5),
    200: Color(0xFFEBE6E5),
    300: Color(0xFFD6D0CD),
    400: Color(0xFFB3AAA6),
    500: Color(0xFF8C817D),
    600: Color(0xFF665D5A),
    700: Color(0xFF453E3C),
    800: Color(0xFF262120),
    900: Color(0xFF000000),
  });

  static const MaterialColor errorSwatch = MaterialColor(0xFFE81A43, <int, Color>{
    100: Color(0xFFFCE8EB),
    500: Color(0xFFE81A43),
    900: Color(0xFF5C0515),
  });

  static const MaterialColor successSwatch = MaterialColor(0xFF21A649, <int, Color>{
    100: Color(0xFFE8F7EC),
    500: Color(0xFF21A649),
    900: Color(0xFF094019),
  });

  static const MaterialColor warningSwatch = MaterialColor(0xFF21A649, <int, Color>{
    100: Color(0xFFFFF8E5),
    500: Color(0xFFF2BA00),
    900: Color(0xFF594200),
  });

  static const background = Color(0xFFF8FAFC);
  static const surface = Colors.white;
  static const surfaceSubtle = Color(0xFFF1F5F9);
  static const border = Color(0xFFE2E8F0);

  static const primary = Color(0xFF0F172A);
  static const primaryLight = Color(0xFF334155);

  static const cash = Color(0xFF2563EB);
  static const debt = Color(0xFFEA580C);
  static const reimbursement = Color(0xFF9333EA);
  static const profit = Color(0xFF16A34A);
  static const expense = Color(0xFFDC2626);

  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF64748B);
  static const textMuted = Color(0xFF94A3B8);
}
