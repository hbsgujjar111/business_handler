import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KTextSelectionTheme {
  KTextSelectionTheme._();

  /// Light Theme
  static TextSelectionThemeData lightTextSelectionTheme = TextSelectionThemeData(
    selectionColor: KColors.secondary,
    cursorColor: KColors.secondary,
    selectionHandleColor: KColors.secondary,
  );

  /// Dark Theme
  static TextSelectionThemeData darkTextSelectionTheme = TextSelectionThemeData(
    selectionColor: KColors.secondary,
    cursorColor: KColors.secondary,
    selectionHandleColor: KColors.secondary,
  );
}
