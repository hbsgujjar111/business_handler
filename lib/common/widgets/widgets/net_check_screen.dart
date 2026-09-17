import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/services/internet_service.dart';
import '../../../utils/constants/assets_strings.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../../styles/spacing_styles.dart';
import 'no_data_widget.dart';

class NetCheckScreen extends ConsumerWidget {
  const NetCheckScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isConnected = ref.watch(internetConnectionProvider);

    return isConnected
        ? child
        : SizedBox(
            width: context.width,
            height: context.height,
            child: Padding(
              padding: KSpacingStyle.kPagePadding,
              child: NoDataWidget(image: KAssets.appLogo, title: "No Internet", detail: "No Internet Connection"),
            ),
          );
  }
}
