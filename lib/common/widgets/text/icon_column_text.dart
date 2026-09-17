import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../icons/image_icon.dart';

class IconColumnText extends StatelessWidget {
  const IconColumnText({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon,
    this.imageIcon,
    this.iconSize,
    this.titleSize,
    this.subTitleSize,
    this.iconColor,
  });

  final String title;
  final String subTitle;
  final HeroIcons? icon;
  final String? imageIcon;
  final double? iconSize;
  final double? titleSize;
  final double? subTitleSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.max,
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

        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: context.textTheme.titleSmall!.copyWith(
                  color: KColors.neutralSwatch.shade300,
                  fontSize: titleSize ?? 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(subTitle, maxLines: 5, style: context.textTheme.titleSmall!.copyWith(fontSize: subTitleSize ?? 14)),
            ],
          ),
        ),
      ],
    );
  }
}
