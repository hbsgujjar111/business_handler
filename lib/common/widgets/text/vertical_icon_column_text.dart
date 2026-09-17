import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../styles/shadow_styles.dart';
import '../icons/image_icon.dart';

class VerticalIconColumnText extends StatelessWidget {
  const VerticalIconColumnText({
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: .center,
      children: [
        /// Icon
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50,
            boxShadow: KShadowStyle.cardShadowDark,
          ),
          child: Center(
            child: icon != null
                ? Skeleton.shade(
                    child: HeroIcon(icon!, size: iconSize ?? 24, color: iconColor ?? KColors.neutralSwatch.shade900),
                  )
                : Skeleton.shade(
                    child: KImageIcon(icon: imageIcon ?? "", size: iconSize ?? 24, color: iconColor),
                  ),
          ),
        ),

        KSizes.spaceBtwItems.h,

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
    );
  }
}
