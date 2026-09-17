import 'package:flutter/material.dart';

import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class KCheckboxTheme {
  KCheckboxTheme._();

  /// Light Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: .circular(4)),
    side: BorderSide(width: 1.0, color: KColors.secondary),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.kWhite;
      } else {
        return KColors.secondary;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.secondary;
      } else {
        return KColors.kTransparent;
      }
    }),
  );

  /// Dark Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: .circular(4)),
    side: BorderSide(width: 2.0, color: KColors.neutralSwatch.shade400),
    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.kWhite;
      } else {
        return KColors.neutralSwatch.shade50;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return KColors.secondary;
      } else {
        return KColors.kTransparent;
      }
    }),
  );
}
