// import 'package:flutter/material.dart';
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/extensions/context_extensions.dart';
//
// Future<DateTime?> kDateTimePicker({
//   required BuildContext context,
//   DateTime? initialDate,
//   DateTime? firstDate,
//   DateTime? lastDate,
//   BoxConstraints dialogSize = const BoxConstraints(maxWidth: 350, maxHeight: 650),
// }) async {
//   DateTime? selectedData = await showOmniDateTimePicker(
//     context: context,
//     initialDate: initialDate ?? DateTime.now(),
//     firstDate: firstDate ?? DateTime(1950),
//     lastDate: lastDate ?? DateTime(2100),
//     is24HourMode: false,
//     isShowSeconds: false,
//     minutesInterval: 1,
//     secondsInterval: 1,
//     borderRadius: const .all(Radius.circular(KSizes.cardRadiusMd)),
//     constraints: dialogSize,
//     transitionBuilder: (context, anim1, anim2, child) =>
//         FadeTransition(opacity: anim1.drive(Tween(begin: 0, end: 1)), child: child),
//     transitionDuration: const Duration(milliseconds: 200),
//     barrierDismissible: true,
//     theme: Theme.of(context).copyWith(
//       colorScheme: Theme.of(context).colorScheme.copyWith(
//         surfaceContainerHigh: context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50,
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: KColors.primary,
//           textStyle: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     ),
//   );
//
//   return selectedData;
// }
