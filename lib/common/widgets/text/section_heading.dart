import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class KSectionHeading extends StatelessWidget {
  const KSectionHeading({
    super.key,
    required this.title,
    this.textColor,
    this.showTrailingText = false,
    this.icon,
    this.iconSize,
    this.textStyle,
    this.trailingText,
    this.trailingTextStyle,
  });

  final String title;
  final Color? textColor;
  final bool showTrailingText;
  final String? trailingText;
  final HeroIcons? icon;
  final double? iconSize;
  final TextStyle? textStyle;
  final TextStyle? trailingTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Row(
          spacing: KSizes.spaceBtwItems,
          children: [
            if (icon != null) HeroIcon(icon!, size: iconSize ?? 24),
            Text(
              title,
              style: textStyle ?? context.textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        if (trailingText != "")
          Text(
            trailingText ?? "",
            style: trailingTextStyle ?? context.textTheme.bodySmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}
