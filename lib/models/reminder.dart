import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/utils/hive_utils.dart' as hive_utils;

part 'reminder.g.dart';

@HiveType(typeId: hive_utils.reminderTypeId)
class Reminder {
  @HiveField(0)
  final bool isDailyNotification;

  @HiveField(1)
  final DateTime dateTime;

  Reminder({@required this.isDailyNotification, @required this.dateTime});

  SchedulableTime get scheduledTime => SchedulableTime(dateTime.hour, dateTime.minute, dateTime.second);

  static bool isSameAs(Reminder reminder1, Reminder reminder2) {
    if(reminder1 ==null && reminder2 == null) {
      return true;
    } else if(reminder1 == null || reminder2 == null){
      return false;
    } else {
      return (reminder1.isDailyNotification == reminder2.isDailyNotification) &&
          ((reminder1.isDailyNotification && reminder1.scheduledTime == reminder2.scheduledTime) ||
              (!reminder1.isDailyNotification && reminder1.dateTime == reminder2.dateTime));
    }
  }

  @override
  String toString() {
    return '''
      Reminder(
        isDailyNotification: $isDailyNotification,
        dateTime: $dateTime
      )
    ''';
  }
}
