import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class KGridLayout extends StatelessWidget {
  const KGridLayout({
    super.key,
    this.crossAxisCount = 2,
    this.mainAxisExtent = 288,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });

  final int itemCount, crossAxisCount;
  final double? mainAxisExtent;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: crossAxisSpacing ?? KSizes.gridViewSpacing,
        mainAxisSpacing: mainAxisSpacing ?? KSizes.gridViewSpacing,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
