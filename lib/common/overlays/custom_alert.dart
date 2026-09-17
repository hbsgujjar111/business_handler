import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class KAlert extends StatelessWidget {
  const KAlert({super.key, required this.child, this.onTapOutside, this.outsideColor});

  final Widget child;
  final Color? outsideColor;
  final void Function()? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTapOutside,
        child: Material(
          color: outsideColor ?? KColors.blackColor.withAlpha((.6 * 255).toInt()),
          child: Center(
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 800),
              tween: Tween(begin: 1.0, end: 0.0),
              // animate from bottom to center
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Opacity(
                  opacity: (1.0 - value).clamp(0.0, 1.0), // Fade in
                  child: Transform.translate(
                    offset: Offset(0, value * 300), // 300px slide from bottom
                    child: child,
                  ),
                );
              },
              child: Material(
                color: KColors.kTransparent,
                child: GestureDetector(onTap: () {}, child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
