import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/string_extensions.dart';
import 'gradient_text.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    this.priceFontSize,
    this.labelFontSize,
    required this.price,
    this.textColor,
    this.isGradient = true,
  });

  final String price;
  final double? priceFontSize;
  final double? labelFontSize;
  final Color? textColor;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      crossAxisAlignment: .end,
      mainAxisSize: .min,
      children: [
        isGradient
            ? GradientText(
                price.formatCurrency(),
                style: context.textTheme.headlineLarge!.copyWith(
                  fontSize: priceFontSize ?? 40,
                  color: textColor ?? KColors.textWhite,
                ),
              )
            : Text(
                price.formatCurrency(),
                style: context.textTheme.headlineLarge!.copyWith(
                  fontSize: priceFontSize ?? 40,
                  color: textColor ?? KColors.textWhite,
                ),
              ),
        isGradient
            ? GradientText(
                "PKR",
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: labelFontSize ?? 12,
                  color: textColor ?? KColors.textWhite,
                ),
              )
            : Text(
                "PKR",
                style: context.textTheme.labelLarge!.copyWith(
                  fontSize: labelFontSize ?? 12,
                  color: textColor ?? KColors.textWhite,
                ),
              ),
      ],
    );
  }
}
