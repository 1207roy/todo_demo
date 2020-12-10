import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return this.isOnSameDay(now);
  }

  String get appFormattedDateTime => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
  String get appFormattedDate => DateFormat('yyyy-MM-dd').format(this);
  String get pickerFormattedDate => DateFormat('dd MMM, yyyy').format(this);
  String get pickerFormattedTime => DateFormat('HH:mm').format(this);

  bool isOnSameDay(DateTime other) =>
      this.day == other.day &&
          this.month == other.month &&
          this.year == other.year;

  String showDateTime({bool isZeroTimeAllowed = false}) {
    if (isZeroTimeAllowed || this.hour != 0 || this.minute != 0 || this.second != 0) {
      return appFormattedDateTime;
    } else {
      return appFormattedDate;
    }
  }
}