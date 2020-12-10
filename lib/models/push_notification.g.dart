// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushNotification _$PushNotificationFromJson(Map json) {
  return PushNotification(
    data: json['data'] == null
        ? null
        : NotificationData.fromJson((json['data'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    notification: json['notification'] == null
        ? null
        : Notification.fromJson((json['notification'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$PushNotificationToJson(PushNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('notification', instance.notification?.toJson());
  return val;
}
