import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class GradientText extends StatelessWidget {
  const GradientText(this.text, {super.key, required this.style, this.color});

  final String text;
  final TextStyle style;
  final Gradient? color;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          (color ?? KColors.linearGradient).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(text, style: style),
    );
  }
}
