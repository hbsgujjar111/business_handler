extension DurationFormat on int? {
  /// Converts nullable seconds into a readable format: Yy Mmo Dd Hh Mm Ss
  /// e.g. 93784 -> "1d 2h 3m 4s", null or 0 -> "0s"
  String toReadableTime() {
    final int totalSeconds = this ?? 0;
    if (totalSeconds <= 0) return '0s';

    const int secondsInMinute = 60;
    const int secondsInHour = 3600;
    const int secondsInDay = 86400;
    const int secondsInMonth = 2592000; // 30 days
    const int secondsInYear = 31536000; // 365 days

    int remaining = totalSeconds;

    final int years = remaining ~/ secondsInYear;
    remaining %= secondsInYear;

    final int months = remaining ~/ secondsInMonth;
    remaining %= secondsInMonth;

    final int days = remaining ~/ secondsInDay;
    remaining %= secondsInDay;

    final int hours = remaining ~/ secondsInHour;
    remaining %= secondsInHour;

    final int minutes = remaining ~/ secondsInMinute;
    final int seconds = remaining % secondsInMinute;

    // Declare parts list AFTER values are known
    final List<String> parts = [];

    if (years > 0) parts.add('${years}y');
    if (months > 0) parts.add('${months}mo');
    if (days > 0) parts.add('${days}d');
    if (hours > 0) parts.add('${hours}h');
    if (minutes > 0) parts.add('${minutes}m');
    if (seconds > 0 || parts.isEmpty) parts.add('${seconds}s');

    return parts.join(' ');
  }
}
