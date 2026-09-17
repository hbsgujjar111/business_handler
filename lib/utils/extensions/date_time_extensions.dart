import 'package:intl/intl.dart';

extension DateTimeAge on DateTime {
  int age() {
    DateTime current = DateTime.now();
    int age = current.year - year;
    if (current.month < month || (current.month == month && current.day < day)) {
      age--;
    }
    return age;
  }

  String formatDate() => DateFormat.yMMMd().format(this);

  String formatDDate() => DateFormat.yMMMEd().format(this);

  String formatTime() => DateFormat().add_jm().format(this);

  String formatDateTime() => DateFormat.yMMMEd().add_jms().format(this);

  String dbDate() => DateFormat("yyyy-MM-dd").format(this);

  String kWeekday() {
    int day = weekday;
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String timeAgo() {
    Duration duration = DateTime.now().difference(this);
    if (duration.inDays >= 365) {
      int years = (duration.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
    if (duration.inDays >= 30) {
      int months = (duration.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    }
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''} ago';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''} ago';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minute${duration.inMinutes > 1 ? 's' : ''} ago';
    }
    if (duration.inSeconds > 0) {
      return '${duration.inSeconds} second${duration.inSeconds > 1 ? 's' : ''} ago';
    }
    return 'Just now';
  }
}
