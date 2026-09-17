import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/extensions/num_extensions.dart';

class KSeparatedListView extends StatelessWidget {
  const KSeparatedListView({
    super.key,
    required this.itemCount,
    this.padding,
    this.physics,
    this.separatorBuilder,
    required this.itemBuilder,
    this.scrollDirection,
    this.controller,
  });

  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final IndexedWidgetBuilder? separatorBuilder;
  final ScrollController? controller;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      controller: controller,
      scrollDirection: scrollDirection ?? Axis.vertical,
      padding: padding ?? EdgeInsets.zero,
      physics: physics ?? AlwaysScrollableScrollPhysics(),
      separatorBuilder: separatorBuilder ?? (_, _) => KSizes.spaceBtwItems.h,
      itemBuilder: itemBuilder,
    );
  }
}
