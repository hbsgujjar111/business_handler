import 'package:flutter/material.dart';

import '../../../common/styles/slider_thumb.dart';
import '../../constants/colors.dart';

class KSliderTheme {
  KSliderTheme._();

  /// Light Theme
  static SliderThemeData lightSliderThemeData = SliderThemeData(
    padding: EdgeInsets.zero,
    trackHeight: 1.5,
    trackShape: const RectangularSliderTrackShape(),
    activeTrackColor: KColors.primary,
    inactiveTrackColor: KColors.neutralSwatch.shade200,
    thumbColor: KColors.kWhite,
    thumbSize: WidgetStateProperty.all(Size(18, 18)),
    thumbShape: const SliderThumbWithShadow(),
    overlayColor: KColors.primary.withValues(alpha: .2),
  );

  /// Dark Theme
  static SliderThemeData darkSliderThemeData = SliderThemeData(
    padding: EdgeInsets.zero,
    trackHeight: 1.5,
    trackShape: const RectangularSliderTrackShape(),
    activeTrackColor: KColors.primary,
    inactiveTrackColor: KColors.neutralSwatch.shade200,
    thumbColor: KColors.kWhite,
    thumbSize: WidgetStateProperty.all(Size(18, 18)),
    thumbShape: const SliderThumbWithShadow(),
    overlayColor: KColors.primary.withValues(alpha: .2),
  );
}
