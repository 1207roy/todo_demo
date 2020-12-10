import 'package:json_annotation/json_annotation.dart';
import 'package:tododemo/models/models.dart';

part 'push_notification.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, nullable: true, explicitToJson: true, includeIfNull: false, anyMap: true)
class PushNotification {
  final NotificationData data;
  final Notification notification;

  PushNotification({
    this.data,
    this.notification,
  });

  factory PushNotification.fromJson(Map<String, dynamic> json) => _$PushNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$PushNotificationToJson(this);
}
