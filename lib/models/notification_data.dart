import 'package:json_annotation/json_annotation.dart';
part 'notification_data.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, nullable: true, explicitToJson: true, includeIfNull: false, anyMap: true)
class NotificationData {
  final String title;
  final String body;
  final String uri;
  final DataType type;
  final String content;

  NotificationData({
    this.title,
    this.body,
    this.uri,
    this.type,
    this.content,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);
}

enum DataType {
  @JsonValue('GROUP_MESSAGE')
  GroupMessage
}
