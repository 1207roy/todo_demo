import 'package:hive/hive.dart';
import 'package:tododemo/models/models.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

const int toDoTypeId = 0;
const int reminderTypeId = 1;

void registerHiveAdapters() {
  Hive.registerAdapter(ToDoAdapter());
  Hive.registerAdapter(ReminderAdapter());
}

///setup path for Hive database.
///register hive adapters using which objects will
/// be cached and retrieved from the hive.
Future initializeHiveDatabase() async {
  final Directory directory = await getApplicationDocumentsDirectory();

  // giving file path to Hive.
  Hive.init(directory.path);

  // setup adapters to support CRUD operations.
  registerHiveAdapters();
}
