// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:heroicons/heroicons.dart';
// import 'package:logger/logger.dart';
// import 'package:url_launcher/url_launcher_string.dart';
//
// import '../../common/overlays/alert_card.dart';
// import '../../common/styles/shadow_styles.dart';
// import '../../i18n/strings.g.dart';
// import '../constants/colors.dart';
// import '../constants/enums.dart';
// import '../constants/sizes.dart';
// import '../extensions/context_extensions.dart';
// import '../routes/app_routes.dart';
//
// class KHelperFunctions {
//   static Gradient getPackageGradient(String? value) {
//     if (value != null) {
//       if (value.toLowerCase().contains("bronze")) {
//         return LinearGradient(
//           begin: AlignmentGeometry.centerLeft,
//           end: AlignmentGeometry.centerRight,
//           colors: [KColors.bronzeDark, KColors.bronzeLight],
//         );
//       } else if (value.toLowerCase().contains("silver")) {
//         return LinearGradient(
//           begin: AlignmentGeometry.centerLeft,
//           end: AlignmentGeometry.centerRight,
//           colors: [KColors.silverDark, KColors.silverLight],
//         );
//       } else if (value.toLowerCase().contains("gold")) {
//         return LinearGradient(
//           begin: AlignmentGeometry.centerLeft,
//           end: AlignmentGeometry.centerRight,
//           colors: [KColors.goldDark, KColors.goldLight],
//         );
//       } else {
//         return LinearGradient(
//           begin: AlignmentGeometry.centerLeft,
//           end: AlignmentGeometry.centerRight,
//           colors: [KColors.primarySwatch.shade700, KColors.primarySwatch.shade300],
//         );
//       }
//     } else {
//       return LinearGradient(
//         begin: AlignmentGeometry.centerLeft,
//         end: AlignmentGeometry.centerRight,
//         colors: [KColors.primarySwatch.shade700, KColors.primarySwatch.shade300],
//       );
//     }
//   }
//
//   static void showStatusAlert({
//     String? title,
//     required final String body,
//     String? buttonText,
//     required final AlertType type,
//     void Function()? onPressed,
//   }) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final overlayState = rootNavigatorKey.currentState?.overlay;
//
//       if (overlayState == null) {
//         Logger().e('Overlay is not available yet.');
//         return;
//       }
//
//       OverlayEntry? entry;
//
//       entry = OverlayEntry(
//         builder: (context) {
//           return AlertCard(
//             title: title,
//             body: body,
//             type: type,
//             buttonText: buttonText,
//             onPressed: () {
//               entry?.remove();
//               entry = null;
//               if (onPressed != null) {
//                 onPressed();
//               }
//             },
//           );
//         },
//       );
//
//       overlayState.insert(entry!);
//     });
//   }
//
//   static void showAppUpdateAlert() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final overlayState = rootNavigatorKey.currentState?.overlay;
//
//       if (overlayState == null) {
//         Logger().e('Overlay is not available yet.');
//         return;
//       }
//
//       OverlayEntry? entry;
//
//       entry = OverlayEntry(
//         builder: (_) {
//           return AlertCard(
//             title: t.newVersionOfAppAvailable,
//             body: t.updateLatestVersion,
//             type: AlertType.warning,
//             buttonText: t.updateNow,
//             onPressed: () async {
//               entry?.remove();
//               entry = null;
//
//               const androidUrl = 'https://play.google.com/store/apps/details?id=com.uts.utstrackingapp';
//               const iosUrl = 'https://apps.apple.com/pk/app/myuts/id1613698217';
//               final url = Platform.isAndroid ? androidUrl : iosUrl;
//
//               if (await canLaunchUrlString(url)) {
//                 await launchUrlString(url, mode: LaunchMode.externalApplication);
//               }
//             },
//           );
//         },
//       );
//
//       overlayState.insert(entry!);
//     });
//   }
//
//   static String getGreeting(String name) {
//     int hour = DateTime.now().hour;
//
//     if (hour >= 5 && hour < 12) {
//       return "${t.goodMorning}, $name!";
//     } else if (hour >= 12 && hour < 17) {
//       return "${t.goodAfternoon}, $name!";
//     } else if (hour >= 17 && hour < 21) {
//       return "${t.goodEvening}, $name!";
//     } else {
//       return "${t.goodNight}, $name!";
//     }
//   }
//
//   static String truncateText(String text, int maxLength) {
//     if (text.length <= maxLength) {
//       return text;
//     } else {
//       return "${text.substring(0, maxLength)}...";
//     }
//   }
//
//   static void copyToClipboard({required BuildContext context, required String text}) {
//     if (text.isNotEmpty) {
//       Clipboard.setData(ClipboardData(text: text));
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: KColors.kTransparent,
//           elevation: 0.0,
//           content: Center(
//             child: Container(
//               constraints: BoxConstraints(minWidth: 160),
//               decoration: BoxDecoration(
//                 color: context.isDarkMode ? KColors.darkModeContainer : KColors.neutralSwatch.shade50,
//                 borderRadius: .circular(50),
//                 boxShadow: KShadowStyle.snackbarShadow2,
//               ),
//               padding: EdgeInsets.all(KSizes.sm),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 spacing: KSizes.spaceBtwItems,
//                 children: [
//                   HeroIcon(.checkCircle, color: KColors.success),
//                   Text(context.t.copiedClipboard, style: context.textTheme.labelLarge),
//                 ],
//               ),
//             ),
//           ),
//           duration: Duration(seconds: 1),
//         ),
//       );
//     }
//   }
//
//   static String timeDifferenceFromNow(DateTime pastTime) {
//     final now = DateTime.now();
//     final difference = now.difference(pastTime);
//
//     final days = difference.inDays;
//     final hours = difference.inHours;
//     final minutes = difference.inMinutes;
//     final seconds = difference.inSeconds;
//
//     if (days > 0) {
//       return '${days}d';
//     } else if (hours > 0) {
//       return '${hours % 24}h';
//     } else if (minutes > 0) {
//       return '${minutes % 60}m';
//     } else {
//       return '${seconds}s';
//     }
//   }
//
//   static VehicleStatus getVehicleStatusFromString(String? status) {
//     switch (status?.toLowerCase()) {
//       case 'moving':
//         return VehicleStatus.moving;
//       case 'parked':
//         return VehicleStatus.parked;
//       case 'idle':
//         return VehicleStatus.idleOnMap;
//       case 'offline':
//         return VehicleStatus.trackerOff;
//       case 'netoff':
//         return VehicleStatus.detached;
//       default:
//         return VehicleStatus.nothing;
//     }
//   }
//
//   static Color getVehicleColorFromString(String? status) {
//     switch (status?.toLowerCase()) {
//       case 'moving':
//         return KColors.movingVehicleColor;
//       case 'parked':
//         return KColors.parkedVehicleColor;
//       case 'idle':
//         return KColors.idleVehicleColor;
//       case 'offline':
//         return KColors.trackerOffVehicleColor;
//       case 'netoff':
//         return KColors.detachedVehicleColor;
//       default:
//         return KColors.totalVehicleColor;
//     }
//   }
//
//   static String getGpsSignalStrength(dynamic gpsSatellite) {
//     int count = int.tryParse(gpsSatellite.toString()) ?? 0;
//
//     if (count <= 7) {
//       return "Weak";
//     } else if (count >= 8 && count <= 13) {
//       return "Average";
//     } else {
//       return "Good";
//     }
//   }
// }
