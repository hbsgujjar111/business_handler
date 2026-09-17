import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KSwitchTheme {
  KSwitchTheme._();

  /// Light Theme
  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(KColors.kWhite),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.secondary;
      } else {
        return KColors.neutralSwatch.shade400;
      }
    }),
    trackOutlineColor: WidgetStateProperty.all(KColors.kTransparent),
  );

  /// dark Theme
  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStatePropertyAll(KColors.kWhite),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.secondary;
      } else {
        return KColors.neutralSwatch.shade400;
      }
    }),
    trackOutlineColor: WidgetStateProperty.all(KColors.kTransparent),
  );
}
