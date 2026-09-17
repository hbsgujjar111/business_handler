import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class KSquareRadio<T> extends StatelessWidget {
  const KSquareRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.size = 24.0,
  });

  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isSelected ? KColors.secondary : Colors.transparent,
          borderRadius: .circular(KSizes.cardRadiusXs),
          border: .all(color: KColors.secondary, width: 1.5),
        ),
        child: isSelected ? HeroIcon(.check, color: KColors.kWhite, size: 16) : null,
      ),
    );
  }
}
