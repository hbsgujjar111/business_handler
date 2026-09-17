import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class KIconTheme {
  KIconTheme._();

  /// Light Theme
  static var lightIconTheme = IconThemeData(color: KColors.primarySwatch.shade800, size: 24);

  /// Dark Theme
  static var darkIconTheme = IconThemeData(color: KColors.kWhite, size: 24);
}
