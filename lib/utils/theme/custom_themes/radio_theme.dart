import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KRadioTheme {
  KRadioTheme._();

  /// Light Theme
  static RadioThemeData lightRadioThemeData = RadioThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.primary;
      }
      return KColors.darkestGrey;
    }),
  );

  /// Dark Theme
  static RadioThemeData darkRadioThemeData = RadioThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.primary;
      }
      return KColors.neutralSwatch.shade400;
    }),
  );
}
