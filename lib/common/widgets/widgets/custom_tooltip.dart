import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../styles/shadow_styles.dart';

class KTooltip extends StatefulWidget {
  final Widget child;
  final String message;

  const KTooltip({required this.child, required this.message, super.key});

  @override
  KTooltipState createState() => KTooltipState();
}

class KTooltipState extends State<KTooltip> {
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy - 40,
        left: offset.dx,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              _overlayEntry?.remove();
              _overlayEntry = null;
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: KColors.kWhite,
                borderRadius: .circular(KSizes.cardRadiusXs),
                boxShadow: KShadowStyle.cardShadowDark,
              ),
              child: Text(widget.message, style: context.textTheme.labelMedium),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: _showTooltip, child: widget.child);
  }
}
