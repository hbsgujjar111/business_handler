import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../icons/image_icon.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.title,
    this.icon,
    this.imageIcon,
    this.iconSize,
    this.titleSize,
    this.iconColor,
  });

  final String title;
  final HeroIcons? icon;
  final String? imageIcon;
  final double? iconSize;
  final double? titleSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: .center,
      children: [
        /// Icon
        icon != null
            ? Skeleton.shade(
                child: HeroIcon(icon!, size: iconSize ?? 24, color: iconColor ?? KColors.neutralSwatch.shade900),
              )
            : Skeleton.shade(
                child: KImageIcon(icon: imageIcon ?? "", size: iconSize ?? 24, color: iconColor),
              ),

        Text(
          title,
          style: context.textTheme.labelSmall!.copyWith(
            color: KColors.neutralSwatch.shade300,
            fontSize: titleSize ?? 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
