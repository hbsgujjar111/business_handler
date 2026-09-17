import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class KShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: KColors.darkGrey.withValues(alpha: .1),
    blurRadius: 10,
    spreadRadius: 2,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: KColors.darkGrey.withValues(alpha: .1),
    blurRadius: 10,
    spreadRadius: 2,
    offset: const Offset(0, 2),
  );

  static final snackbarShadow = BoxShadow(
    color: KColors.neutralSwatch.shade800,
    blurRadius: 48,
    offset: Offset(0, 16),
    spreadRadius: 0,
  );

  static final snackbarShadow2 = [
    BoxShadow(color: Color(0x190F0F10), blurRadius: 15, offset: Offset(0, 10), spreadRadius: -3),
    BoxShadow(color: Color(0x0C000000), blurRadius: 6, offset: Offset(0, 4), spreadRadius: -2),
  ];

  static final fabShadow = [
    BoxShadow(offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1, color: Color(0x0F0F1014)),
    BoxShadow(offset: Offset(0, 2), blurRadius: 4, spreadRadius: 0, color: Color(0x0F0F100F)),
  ];

  static final cardShadow = [
    BoxShadow(color: Color(0x0F750B02), offset: Offset(0, 4), blurRadius: 15, spreadRadius: -2),
  ];
  static final cardShadowDark = [
    BoxShadow(color: Color(0x190F0F10), blurRadius: 25, offset: Offset(0, 20), spreadRadius: -5),
    BoxShadow(color: Color(0x0A0F0F10), blurRadius: 10, offset: Offset(0, 10), spreadRadius: -5),
  ];

  static final buttonShadow = [
    BoxShadow(color: Color(0x190F0F10), blurRadius: 15, offset: Offset(0, 10), spreadRadius: -3),
    BoxShadow(color: Color(0x0C000000), blurRadius: 6, offset: Offset(0, 4), spreadRadius: -2),
  ];

  static final bottomSheetShadow = [
    BoxShadow(color: Color(0x190F0F10), blurRadius: 25, offset: Offset(0, 20), spreadRadius: -5),
    BoxShadow(color: Color(0x0A0F0F10), blurRadius: 10, offset: Offset(0, 10), spreadRadius: -5),
  ];

  static final bottomSheetShadow1 = [
    BoxShadow(color: Color(0x190F0F10), blurRadius: 16, offset: Offset(-6, -6), spreadRadius: 2),
    BoxShadow(color: Color(0x0A0F0F10), blurRadius: 10, offset: Offset(0, -5), spreadRadius: 2),
  ];

  static final darkestShadow = [
    BoxShadow(color: Color(0x2D101828), blurRadius: 48, offset: Offset(0, 24), spreadRadius: -12),
  ];
}
