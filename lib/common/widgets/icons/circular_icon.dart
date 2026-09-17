import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../utils/constants/colors.dart';
import 'image_icon.dart';

class KCircularIcon extends StatelessWidget {
  const KCircularIcon({
    super.key,
    this.icon,
    this.width,
    this.height,
    this.iconSize,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.paddingSize = 0.0,
    this.imageIcon,
    this.isImageIcon = false,
    this.borderRadius,
    this.boxShadow,
  });

  final double? width, height, iconSize;
  final HeroIcons? icon;
  final String? imageIcon;
  final bool isImageIcon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double paddingSize;
  final double? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? (KColors.kWhite.withValues(alpha: .9)),
          borderRadius: .circular(borderRadius ?? 150),
          boxShadow: boxShadow,
        ),
        padding: EdgeInsets.all(paddingSize),
        child: isImageIcon
            ? KImageIcon(icon: imageIcon!, size: iconSize, color: color)
            : HeroIcon(icon!, color: color, size: iconSize),
      ),
    );
  }
}
