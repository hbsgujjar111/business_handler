import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SliderThumbWithShadow extends SliderComponentShape {
  final double thumbRadius;

  const SliderThumbWithShadow({this.thumbRadius = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Shadow 1
    final shadow1 = Paint()
      ..color =
          const Color(0x1A000000) // #0000001A (10% opacity)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.65);
    canvas.drawCircle(center.translate(0, 1.94), thumbRadius, shadow1);

    // Shadow 2
    final shadow2 = Paint()
      ..color =
          const Color(0x29000000) // #00000029 (16% opacity)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.65);
    canvas.drawCircle(center.translate(0, 0.65), thumbRadius, shadow2);

    // Shadow 3
    final shadow3 = Paint()
      ..color =
          const Color(0x26000000) // #00000026 (15% opacity)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.17);
    canvas.drawCircle(center.translate(0, 1.94), thumbRadius, shadow3);

    // Thumb circle
    final thumbPaint = Paint()..color = sliderTheme.thumbColor ?? KColors.kWhite;
    canvas.drawCircle(center, thumbRadius, thumbPaint);
  }
}
