import 'package:flutter/material.dart';

import '../../../utils/constants/assets_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../../utils/extensions/num_extensions.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.image, this.title, this.detail, this.imageWidth});

  final String? image;
  final String? title;
  final String? detail;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          /// image
          Image.asset(image ?? KAssets.noData, color: KColors.primarySwatch.shade300, width: imageWidth ?? 100),
          32.h,

          /// title
          Text(title ?? "No Data Found", style: context.textTheme.headlineMedium),
          KSizes.spaceBtwItems.h,

          /// detail
          if (detail != null) Text(detail!, textAlign: TextAlign.center, style: context.textTheme.titleSmall),
        ],
      ),
    );
  }
}
