import 'package:tododemo/models/models.dart';

abstract class LocalNotificationManager {
  Future<void> cancelNotification(int id);

  Future<void> scheduleDailyReminderNotification(
    int channelId,
    SchedulableTime scheduledTime,
    String content,
    String payload,
  );

  Future<void> scheduleReminderNotification(
    int channelId,
    DateTime dateTime,
    String content,
    String payload,
  );

  Future<void> showNotification(PushNotification pushNotification);
}
