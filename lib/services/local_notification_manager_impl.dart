import 'dart:async';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/service_locator.dart';
import 'package:tododemo/services/services.dart';

final FlutterLocalNotificationsPlugin _localNotificationPlugin = FlutterLocalNotificationsPlugin();
final localNotificationManager = LocalNotificationManagerImpl._(_localNotificationPlugin);

Future<void> initializeLocalNotificationManager() async {
  await localNotificationManager.initialize();
  if (!locator.isRegistered(instance: localNotificationManager)) {
    locator.registerSingleton<LocalNotificationManager>(localNotificationManager);
  }
}

enum _InitializationStatus {
  none,
  initializing,
  initialized,
}

class LocalNotificationManagerImpl implements LocalNotificationManager {
  static final int dailyReminderNotificationId = 100;
  static final int scheduledReminderNotificationId = 150;

  static const String _channelId = "news_app";
  static const String _channelName = "Push Notification";
  static const String _channelDescription = "Displays notifications for friend requests, goup request etc.";

  final FlutterLocalNotificationsPlugin _plugin;
  _InitializationStatus _status = _InitializationStatus.none;

  LocalNotificationManagerImpl._(this._plugin);

  Future<void> initialize() async {
    if (_status == _InitializationStatus.none) {
      _status = _InitializationStatus.initializing;
      var androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      var iosSettings = IOSInitializationSettings();
      var initializationSettings = InitializationSettings(androidSettings, iosSettings);
      await _plugin.initialize(initializationSettings);
      _status = _InitializationStatus.initialized;
    }
  }

  @override
  Future<void> cancelNotification(int id) async {
    return await _plugin.cancel(id);
  }

  @override
  Future<void> scheduleDailyReminderNotification(int channelId, SchedulableTime scheduledTime, String content, String payload) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'daily_reminder', 'Daily Reminder', 'News update reminder notification',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );
    return await _plugin.showDailyAtTime(
      channelId ?? dailyReminderNotificationId,
      'Daily Reminder',
      content,
      scheduledTime.toTime(),
      platformChannelSpecifics,
      payload: payload,
    );
  }

  @override
  Future<void> scheduleReminderNotification(int channelId, DateTime dateTime, String content, String payload) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'schedual_reminder', 'Schedual Reminder', 'News update reminder notification',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );
    return await _plugin.schedule(
      channelId ?? scheduledReminderNotificationId,
      'Scheduled Reminder',
      content,
      dateTime,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  @override
  Future<void> showNotification(PushNotification pushNotification) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(_channelId, _channelName, _channelDescription,
        importance: Importance.Max, priority: Priority.High, channelShowBadge: true);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics,
      iOSPlatformChannelSpecifics,
    );
    var random = Random();
    if (pushNotification.notification != null &&
        pushNotification.notification.title != null &&
        pushNotification.notification.body != null) {
      if (pushNotification.notification.title.isEmpty || pushNotification.notification.body.isEmpty) {
        return;
      }
      return _plugin.show(random.nextInt(1000), pushNotification.notification.title, pushNotification.notification.body,
          platformChannelSpecifics,
          payload: pushNotification.data.uri);
    } else if (pushNotification.data?.body != null &&
        pushNotification.data?.title != null &&
        pushNotification.data?.uri != null) {
      return _plugin.show(
          random.nextInt(1000), pushNotification.data.title, pushNotification.data.body, platformChannelSpecifics,
          payload: pushNotification.data.uri);
    }
  }
}

extension _SchedulableTimeExtension on SchedulableTime {
  Time toTime() {
    return Time(
      hour,
      minute,
      second,
    );
  }
}
