import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class KSpacingStyle {
  KSpacingStyle._();

  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: KSizes.appBarHeight,
    bottom: KSizes.defaultSpace,
    left: KSizes.defaultSpace,
    right: KSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingWithNoBottom = EdgeInsets.only(
    top: KSizes.defaultSpace,
    right: KSizes.defaultSpace,
    left: KSizes.defaultSpace,
    bottom: 0,
  );

  static const EdgeInsetsGeometry kSymmetricPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  static const EdgeInsetsGeometry kPagePadding = EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  static const EdgeInsetsGeometry kHorizontalPadding = EdgeInsets.symmetric(horizontal: 16);

  static const EdgeInsetsGeometry kVerticalPadding = EdgeInsets.symmetric(vertical: 20);
}
