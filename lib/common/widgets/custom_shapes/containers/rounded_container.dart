import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class KRoundedContainer extends StatelessWidget {
  const KRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.margin,
    this.padding,
    this.showBorder = false,
    this.radius = KSizes.cardRadiusLg,
    this.backgroundColor = KColors.kWhite,
    this.borderColor = KColors.borderPrimary,
    this.borderWidth,
    this.boxShadow,
  });

  final double? width;
  final double? height;
  final double radius;
  final double? borderWidth;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: .circular(radius),
        border: showBorder ? .all(color: borderColor, width: borderWidth ?? 1.0) : null,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
