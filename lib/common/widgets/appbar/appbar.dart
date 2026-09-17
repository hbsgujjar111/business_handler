import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/extensions/context_extensions.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    this.leadingIcon,
    this.actions,
    this.leadingFunction,
    this.backgroundColor,
    this.backIconColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingFunction;
  final Color? backgroundColor;
  final Color? backIconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: centerTitle,
      leading: (showBackArrow || automaticallyImplyLeading)
          ? IconButton(
              onPressed: () => context.pop(),
              icon: HeroIcon(
                .arrowLongLeft,
                color: backIconColor ?? (context.isDarkMode ? KColors.kWhite : KColors.primarySwatch.shade800),
              ),
            )
          : leadingIcon != null
          ? IconButton(onPressed: leadingFunction, icon: leadingIcon!)
          : null,
      title: title,
      backgroundColor: backgroundColor ?? KColors.kTransparent,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
