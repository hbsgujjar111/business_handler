import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/extensions/context_extensions.dart';
import '../../utils/extensions/num_extensions.dart';
import '../styles/spacing_styles.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key, this.title, required this.body, this.buttonText, required this.type, this.onPressed});

  final String? title;
  final String body;
  final String? buttonText;
  final AlertType type;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: KColors.blackColor.withValues(alpha: .6),
        child: Center(
          child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 800),
            tween: Tween(begin: 0.0, end: 1.0),
            curve: Curves.easeInOut,
            builder: (context, scale, child) => Opacity(opacity: scale, child: child),
            child: Material(
              color: KColors.kTransparent,
              child: Center(
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(color: KColors.kWhite, borderRadius: .circular(KSizes.cardRadiusMd * 2)),
                  padding: KSpacingStyle.kPagePadding,
                  margin: KSpacingStyle.kSymmetricPadding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: KSizes.spaceBtwItems,
                    children: [
                      32.h,

                      /// icon
                      HeroIcon(
                        type == AlertType.error
                            ? .xCircle
                            : type == AlertType.success
                            ? .checkBadge
                            : .exclamationTriangle,
                        size: 48,
                        color: type == AlertType.error
                            ? KColors.error
                            : type == AlertType.success
                            ? KColors.success
                            : KColors.warning,
                      ),

                      /// title
                      // Text(
                      //   title ??
                      //       (type == AlertType.error
                      //           ? context.t.error
                      //           : type == AlertType.success
                      //           ? context.t.successful
                      //           : context.t.attention),
                      //   style: context.textTheme.headlineMedium,
                      // ),

                      /// body
                      Text(body, style: context.textTheme.titleSmall),
                      KSizes.defaultSpace.h,

                      /// button
                      // SizedBox(
                      //   width: context.width,
                      //   child: ElevatedButton(
                      //     onPressed: onPressed,
                      //     style: ElevatedButton.styleFrom(
                      //       maximumSize: Size.fromHeight(48),
                      //       padding: EdgeInsets.symmetric(vertical: 12),
                      //     ),
                      //     // child: Text(buttonText ?? context.t.continueText),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
