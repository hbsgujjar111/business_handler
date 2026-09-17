import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:toastification/toastification.dart';

import '../../common/styles/shadow_styles.dart';
import '../constants/colors.dart';
import '../theme/custom_themes/text_themes.dart';

class SnackbarHelper {
  static void successSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: HeroIcon(.checkCircle, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.success,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: .circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void errorSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: HeroIcon(.xCircle, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.error,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: .circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void warningSnackBar(String message) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle.copyWith(color: KColors.blackColor)),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: HeroIcon(.exclamationTriangle, color: KColors.blackColor),
      showIcon: true,
      backgroundColor: KColors.warning,
      foregroundColor: KColors.blackColor,
      padding: const EdgeInsets.all(16),
      borderRadius: .circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.blackColor),
        ),
      ),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }

  static void infoSnackBar(String message, {void Function(ToastificationItem)? onTap}) {
    toastification.dismissAll();
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      description: Text(message, style: KTextTheme.snackBarTextStyle),
      alignment: Alignment.topRight,
      animationDuration: const Duration(milliseconds: 300),
      icon: HeroIcon(.exclamationCircle, color: KColors.kWhite),
      showIcon: true,
      backgroundColor: KColors.info,
      foregroundColor: KColors.kWhite,
      padding: const EdgeInsets.all(16),
      borderRadius: .circular(12),
      borderSide: BorderSide.none,
      boxShadow: [KShadowStyle.snackbarShadow],
      closeButton: ToastCloseButton(
        buttonBuilder: (context, onClose) => IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 16, color: KColors.kWhite),
        ),
      ),
      callbacks: ToastificationCallbacks(onTap: onTap),
      showProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }
}
