import 'package:equatable/equatable.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/utils/hive_utils.dart' as hive_utils;
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: hive_utils.toDoTypeId)
class ToDo extends HiveObject implements Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  Reminder reminder;

  ToDo({this.id, this.title, this.body, this.reminder});

  factory ToDo.initial() {
    return ToDo();
  }

  void clear() {
    this.title = null;
    this.body = null;
    this.reminder = null;
    this.save();
  }

  @override
  String toString() {
    return '''ToDo {
      title: $title,
      body: $body,
    }''';
  }

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => false;
}
