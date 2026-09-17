import 'package:flutter/material.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/extensions/context_extensions.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.appVersion,
      style: context.textTheme.titleSmall!.copyWith(color: KColors.neutralSwatch.shade300),
    );
  }
}
