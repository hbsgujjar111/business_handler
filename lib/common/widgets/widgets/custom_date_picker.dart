// import 'package:calendar_date_picker2/calendar_date_picker2.dart';
// import 'package:flutter/material.dart';
// import 'package:heroicons/heroicons.dart';
// import 'package:intl/intl.dart';
//
// import '../../../i18n/strings.g.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/extensions/context_extensions.dart';
//
// Future<DateTime?> kDatePicker({
//   required BuildContext context,
//   DateTime? initialDate,
//   DateTime? currentDate,
//   DateTime? firstDate,
//   DateTime? lastDate,
//   Size dialogSize = const Size(325, 440),
// }) async {
//   List<DateTime?> defaultValue = [initialDate ?? DateTime.now()];
//
//   var selectedData = await showCalendarDatePicker2Dialog(
//     context: context,
//     config: CalendarDatePicker2WithActionButtonsConfig(
//       controlsTextStyle: context.textTheme.titleSmall,
//       currentDate: currentDate ?? DateTime.now(),
//       firstDate: firstDate ?? DateTime(1950),
//       lastDate: lastDate ?? DateTime(2100),
//       calendarType: CalendarDatePicker2Type.single,
//       calendarViewMode: CalendarDatePicker2Mode.day,
//       firstDayOfWeek: 1,
//       centerAlignModePicker: true,
//       cancelButton: Text(
//         context.t.close,
//         style: context.textTheme.titleSmall!.copyWith(decoration: TextDecoration.none),
//       ),
//       okButton: Container(
//         decoration: BoxDecoration(color: KColors.primary, borderRadius: .circular(KSizes.borderRadiusMd)),
//         padding: EdgeInsets.all(10),
//         child: Text(context.t.done, style: context.textTheme.titleSmall!.copyWith(color: KColors.kWhite)),
//       ),
//       buttonPadding: EdgeInsets.only(right: 16),
//       weekdayLabelTextStyle: context.textTheme.titleSmall,
//       nextMonthIcon: HeroIcon(
//         .chevronRight,
//         size: 20,
//         color: context.isDarkMode ? KColors.neutralSwatch.shade50 : KColors.neutralSwatch.shade900,
//       ),
//       lastMonthIcon: HeroIcon(
//         .chevronLeft,
//         size: 20,
//         color: context.isDarkMode ? KColors.neutralSwatch.shade50 : KColors.neutralSwatch.shade900,
//       ),
//       customModePickerIcon: HeroIcon(
//         .chevronDown,
//         size: 16,
//         color: context.isDarkMode ? KColors.neutralSwatch.shade50 : KColors.neutralSwatch.shade900,
//       ),
//       dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) => Container(
//         decoration: decoration?.copyWith(
//           color: KColors.kTransparent,
//           border: isSelected!
//               ? .all(color: KColors.primary, width: 2.0)
//               : .all(color: KColors.kTransparent),
//         ),
//         child: Center(
//           child: Text(
//             MaterialLocalizations.of(context).formatDecimal(date.day),
//             style: textStyle!.copyWith(
//               color: isDisabled!
//                   ? context.isDarkMode
//                         ? KColors.neutralSwatch.shade400
//                         : KColors.neutralSwatch.shade200
//                   : (isSelected!
//                         ? KColors.primary
//                         : isToday!
//                         ? KColors.primary
//                         : context.isDarkMode
//                         ? KColors.neutralSwatch.shade50
//                         : KColors.neutralSwatch.shade900),
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//       monthBuilder: ({decoration, isCurrentMonth, isDisabled, isSelected, required month, textStyle}) => Container(
//         decoration: decoration?.copyWith(
//           color: isSelected! ? KColors.primary : KColors.kTransparent,
//           borderRadius: .circular(KSizes.cardRadiusMd),
//         ),
//         child: Center(
//           child: Text(
//             DateFormat('MMMM').format(DateTime(DateTime.now().year, month)),
//             style: textStyle!.copyWith(
//               color: isDisabled!
//                   ? context.isDarkMode
//                         ? KColors.neutralSwatch.shade400
//                         : KColors.neutralSwatch.shade200
//                   : (isSelected!
//                         ? KColors.kWhite
//                         : isCurrentMonth!
//                         ? KColors.kWhite
//                         : context.isDarkMode
//                         ? KColors.neutralSwatch.shade50
//                         : KColors.neutralSwatch.shade900),
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//       yearBuilder: ({decoration, isCurrentYear, isDisabled, isSelected, textStyle, required year}) => Container(
//         decoration: decoration?.copyWith(
//           color: isSelected! ? KColors.primary : KColors.kTransparent,
//           borderRadius: .circular(KSizes.cardRadiusMd),
//         ),
//         child: Center(
//           child: Text(
//             year.toString(),
//             style: textStyle!.copyWith(
//               color: isDisabled!
//                   ? context.isDarkMode
//                         ? KColors.neutralSwatch.shade400
//                         : KColors.neutralSwatch.shade200
//                   : (isSelected!
//                         ? KColors.kWhite
//                         : isCurrentYear!
//                         ? KColors.kWhite
//                         : context.isDarkMode
//                         ? KColors.neutralSwatch.shade50
//                         : KColors.neutralSwatch.shade900),
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     ),
//     dialogSize: dialogSize,
//     dialogBackgroundColor: context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50,
//     value: defaultValue,
//     borderRadius: .circular(KSizes.cardRadiusLg),
//     builder: (context, child) => Theme(
//       data: ThemeData(
//         splashColor: KColors.primary,
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: KColors.primarySwatch),
//       ),
//       child: child!,
//     ),
//   );
//
//   return selectedData?.first;
// }
