import 'package:intl/intl.dart';

import '../validators/validator_helper.dart';

extension GetStringUtils on String {
  bool get isNumericOnly => KValidatorHelper.isNumericOnly(this);

  bool get isAlphabetOnly => KValidatorHelper.isAlphabetOnly(this);

  bool get isVectorFileName => KValidatorHelper.isVector(this);

  bool get isImageFileName => KValidatorHelper.isImage(this);

  bool get isAudioFileName => KValidatorHelper.isAudio(this);

  bool get isVideoFileName => KValidatorHelper.isVideo(this);

  bool get isTxtFileName => KValidatorHelper.isTxt(this);

  bool get isDocumentFileName => KValidatorHelper.isWord(this);

  bool get isExcelFileName => KValidatorHelper.isExcel(this);

  bool get isPPTFileName => KValidatorHelper.isPPT(this);

  bool get isAPKFileName => KValidatorHelper.isAPK(this);

  bool get isPDFFileName => KValidatorHelper.isPDF(this);

  bool get isHTMLFileName => KValidatorHelper.isHTML(this);

  bool get isURL => KValidatorHelper.isURL(this);

  bool get isEmail => KValidatorHelper.isEmail(this);

  bool get isPhoneNumber => KValidatorHelper.isPhoneNumber(this);

  bool get isDateTime => KValidatorHelper.isDateTime(this);

  bool get isMD5 => KValidatorHelper.isMD5(this);

  bool get isSHA1 => KValidatorHelper.isSHA1(this);

  bool get isSHA256 => KValidatorHelper.isSHA256(this);

  bool get isBinary => KValidatorHelper.isBinary(this);

  bool get isIPv4 => KValidatorHelper.isIPv4(this);

  bool get isIPv6 => KValidatorHelper.isIPv6(this);

  bool get isHexadecimal => KValidatorHelper.isHexadecimal(this);

  bool get isPassport => KValidatorHelper.isPassport(this);

  bool get isCurrency => KValidatorHelper.isCurrency(this);

  bool isCaseInsensitiveContains(String b) => KValidatorHelper.isCaseInsensitiveContains(this, b);

  bool isCaseInsensitiveContainsAny(String b) => KValidatorHelper.isCaseInsensitiveContainsAny(this, b);

  String? get capitalize => KValidatorHelper.capitalize(this);

  String? get capitalizeFirst => KValidatorHelper.capitalizeFirst(this);

  String get removeAllWhitespace => KValidatorHelper.removeAllWhitespace(this);

  String? get camelCase => KValidatorHelper.camelCase(this);

  String? get paramCase => KValidatorHelper.paramCase(this);

  String numericOnly({bool firstWordOnly = false}) => KValidatorHelper.numericOnly(this, firstWordOnly: firstWordOnly);

  /// function to format currency
  String formatCurrency() {
    if (toString().isEmpty) return "0";

    final number = num.tryParse(toString());
    if (number == null) return "0";

    final formatter = NumberFormat("#,##,###.##");
    return formatter.format(number);
  }

  /// Parses a string in "dd/MM/yyyy" format and returns a formatted string.
  /// [outputFormat] defaults to "MMMM d, yyyy" (e.g., March 8, 2022)
  // String formatDate({DateFormat? outputFormat}) {
  //   try {
  //     final parsedDate = DateFormat('dd/MM/yyyy').parse(this);
  //     return outputFormat == null ? DateFormat.yMMMMd().format(DateTime.parse(this)) : outputFormat.format(parsedDate);
  //   } catch (e) {
  //     return this;
  //   }
  // }

  String formatDate({DateFormat? outputFormat}) {
    try {
      return outputFormat == null
          ? DateFormat.yMMMMd().format(DateTime.parse(this))
          : outputFormat.format(DateTime.parse(this));
    } catch (e) {
      return this;
    }
  }

  String formatTime({DateFormat? outputFormat}) {
    try {
      return outputFormat == null
          ? DateFormat().add_jm().format(DateTime.parse(this))
          : outputFormat.format(DateTime.parse(this));
    } catch (e) {
      return this;
    }
  }

  /// Converts "MM/dd/yyyy hh:mm:s a" to "yyyy-MM-dd HH:mm:ss"
  DateTime get toStandardDateTime {
    try {
      // Parse the input
      final inputFormat = DateFormat("MM/dd/yyyy hh:mm:s a");
      final dateTime = inputFormat.parse(this);

      // Output format: similar to DateTime.now()
      final outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      return DateTime.parse(outputFormat.format(dateTime));
    } catch (e) {
      return DateTime.now();
    }
  }

  /// convert give date time to timestamp format like 2025-05-05 10:07:41.065754
  String toFormattedTimestamp() {
    final dateTimeRegex = RegExp(r'^(\d{1,2})/(\d{1,2})/(\d{4})(?: (\d{1,2}):(\d{2})(?::(\d{2}))? ?([AP]M)?)?$');

    final match = dateTimeRegex.firstMatch(trim());

    if (match == null) {
      throw FormatException('Invalid date format: $this');
    }

    int month = int.parse(match.group(1)!);
    int day = int.parse(match.group(2)!);
    int year = int.parse(match.group(3)!);

    int hour = 0;
    int minute = 0;
    int second = 0;

    // Time is included
    if (match.group(4) != null) {
      hour = int.parse(match.group(4)!);
      minute = int.parse(match.group(5)!);
      second = match.group(6) != null ? int.parse(match.group(6)!) : 0;
      String? meridiem = match.group(7);

      // Convert to 24-hour format if meridiem is present
      if (meridiem != null) {
        meridiem = meridiem.toUpperCase();
        if (meridiem == 'PM' && hour != 12) hour += 12;
        if (meridiem == 'AM' && hour == 12) hour = 0;
      }
    }

    final dt = DateTime(year, month, day, hour, minute, second);
    return dt.toString();
  }

  /// remove first comma part of long string
  String removeFirstPart() {
    if (isEmpty) return "---";

    int index = indexOf(',');
    if (index == -1) return this; // No comma found, return the whole string

    // Returns everything after the first comma and removes leading/trailing spaces
    return substring(index + 1).trim();
  }
}

extension DynamicToDouble on Object? {
  /// to double get string check for null and return double
  double toDouble() {
    return double.tryParse(this?.toString() ?? '') ?? 0.0;
  }
}
