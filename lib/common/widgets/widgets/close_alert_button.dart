import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class CloseAlertButton extends StatelessWidget {
  const CloseAlertButton({super.key, required this.child, this.onTap});

  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        /// close button
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(onTap: onTap ?? () => context.pop(), child: HeroIcon(.xMark, size: 24)),
        ),
      ],
    );
  }
}
