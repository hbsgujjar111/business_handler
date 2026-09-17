// import 'package:flutter/material.dart';
// import 'package:heroicons/heroicons.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/extensions/context_extensions.dart';
// import '../../styles/spacing_styles.dart';
// import 'custom_date_picker.dart';
//
// class DatePickerField extends StatelessWidget {
//   const DatePickerField({
//     super.key,
//     required this.title,
//     this.bgColor,
//     this.onTap,
//     this.initialDate,
//     this.currentDate,
//     this.firstDate,
//     this.lastDate,
//   });
//
//   final String title;
//   final Color? bgColor;
//   final DateTime? initialDate;
//   final DateTime? currentDate;
//   final DateTime? firstDate;
//   final DateTime? lastDate;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:
//           onTap ??
//           () async {
//             await kDatePicker(
//               context: context,
//               initialDate: initialDate,
//               currentDate: currentDate,
//               firstDate: firstDate,
//               lastDate: lastDate,
//             ).then((value) => ());
//           },
//       child: Container(
//         height: 56,
//         width: context.width,
//         decoration: BoxDecoration(
//           color: bgColor ?? (context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50),
//           borderRadius: .circular(KSizes.borderRadiusLg),
//         ),
//         padding: KSpacingStyle.kSymmetricPadding,
//         child: Row(
//           mainAxisAlignment: .spaceBetween,
//           children: [
//             Text(title, style: context.textTheme.titleSmall),
//             HeroIcon(
//               .calendarDays,
//               size: 24.0,
//               color: context.isDarkMode ? KColors.neutralSwatch.shade50 : KColors.neutralSwatch.shade900,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
