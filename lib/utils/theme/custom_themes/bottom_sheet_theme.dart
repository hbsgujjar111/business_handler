import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KBottomSheetTheme {
  KBottomSheetTheme._();

  /// Light Theme
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: KColors.neutralSwatch.shade50,
    modalBackgroundColor: KColors.neutralSwatch.shade50,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
  );

  /// Dark Theme
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: KColors.darkModeContainer,
    modalBackgroundColor: KColors.darkModeContainer,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
  );
}
