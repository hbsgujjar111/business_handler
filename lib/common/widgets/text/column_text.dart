import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleFontSize,
    this.subTitleFontSize,
    this.titleFontWeight,
    this.subTitleFontWeight,
    this.titleColor,
    this.subTitleColor,
    this.isInverted = false,
    this.maxLines = 3,
    this.subWidget,
  });

  final String title;
  final String subTitle;
  final double? titleFontSize;
  final double? subTitleFontSize;
  final FontWeight? titleFontWeight;
  final FontWeight? subTitleFontWeight;
  final Color? titleColor;
  final Color? subTitleColor;
  final bool isInverted;
  final int maxLines;
  final Widget? subWidget;

  @override
  Widget build(BuildContext context) {
    return isInverted
        ? Column(
            spacing: 2.0,
            crossAxisAlignment: .start,
            children: [
              subWidget ??
                  Text(
                    title,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: subTitleColor ?? KColors.primarySwatch.shade700,
                      fontSize: subTitleFontSize ?? 14.0,
                      fontWeight: subTitleFontWeight ?? FontWeight.w500,
                      fontFamily: "Flame",
                    ),
                  ),
              Text(
                subTitle,
                textDirection: TextDirection.rtl,
                style: context.textTheme.labelSmall!.copyWith(
                  color: titleColor ?? KColors.primarySwatch.shade500,
                  fontSize: titleFontSize ?? 10.0,
                  fontWeight: titleFontWeight ?? FontWeight.w500,
                ),
              ),
            ],
          )
        : Column(
            spacing: 2.0,
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                textDirection: TextDirection.rtl,
                style: context.textTheme.labelSmall!.copyWith(
                  color: titleColor ?? KColors.primarySwatch.shade700,
                  fontSize: titleFontSize ?? 10.0,
                  fontWeight: titleFontWeight ?? FontWeight.w500,
                ),
              ),
              subWidget ??
                  Text(
                    subTitle,
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: subTitleColor ?? KColors.primarySwatch.shade500,
                      fontSize: subTitleFontSize ?? 14.0,
                      fontWeight: subTitleFontWeight ?? FontWeight.w500,
                      fontFamily: "Flame",
                    ),
                  ),
            ],
          );
  }
}
