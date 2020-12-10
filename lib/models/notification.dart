import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable(
    fieldRename: FieldRename.snake, nullable: true, explicitToJson: true, includeIfNull: false, anyMap: true)
class Notification {
  final String title;
  final String body;

  Notification({this.title, this.body});

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
