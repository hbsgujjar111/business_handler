import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KDrawerTheme {
  KDrawerTheme._();

  /// Light Theme
  static DrawerThemeData lightDrawerThemeData = DrawerThemeData(scrimColor: KColors.blackColor.withValues(alpha: .4));

  /// Dark Theme
  static DrawerThemeData darkDrawerThemeData = DrawerThemeData(scrimColor: KColors.blackColor.withValues(alpha: .4));
}
