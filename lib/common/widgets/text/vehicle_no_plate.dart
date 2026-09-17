import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';

class VehicleNumberPlate extends StatelessWidget {
  const VehicleNumberPlate({super.key, required this.number, required this.year});

  final String number;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50,
        borderRadius: .circular(KSizes.cardRadiusSm),
        border: .symmetric(
          vertical: BorderSide(color: KColors.primary, width: 5),
          horizontal: BorderSide(color: KColors.primary, width: 1),
        ),
      ),
      padding: EdgeInsets.all(KSizes.spaceBtwItems / 2),
      child: Column(
        children: [
          FittedBox(child: Text(number, style: context.textTheme.labelMedium)),
          Text(year, style: context.textTheme.labelMedium!.copyWith(color: KColors.neutralSwatch.shade300)),
        ],
      ),
    );
  }
}
