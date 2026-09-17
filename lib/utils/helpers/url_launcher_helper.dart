import 'dart:io';

import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'snackbar_helper.dart';

class UrlLauncherHelper {
  /// function to send email
  static Future<void> launchEmail({
    required String toEmail,
    String subject = "Rider App Support Needed",
    String body = "Hey! I want to discuss something",
  }) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: encodeQueryParameters({'subject': subject, 'body': body}),
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
      } else {
        throw "No email client found to handle mailto URI";
      }
    } catch (e, s) {
      Logger().f(e.toString(), stackTrace: s);
      SnackbarHelper.errorSnackBar("something went wrong");
    }
  }

  /// function to make a phone call
  static Future<void> launchPhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch phone dialer';
      }
    } catch (e) {
      Logger().e(e.toString());
      SnackbarHelper.errorSnackBar("something went wrong");
    }
  }

  /// function to open whatsapp chat and message
  static Future<void> launchWhatsApp({required String phoneNumber, required String message}) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}");

    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      Logger().e(e.toString());
      SnackbarHelper.errorSnackBar("something went wrong");
    }
  }

  /// function to open app store or play store
  static Future<void> launchAppStore() async {
    const androidUrl = 'https://play.google.com/store/apps/details?id=com.uts.utstrackingapp';
    const iosUrl = 'https://apps.apple.com/pk/app/myuts/id1613698217';
    final url = Platform.isAndroid ? androidUrl : iosUrl;

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }
}
