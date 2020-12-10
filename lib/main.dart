import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tododemo/app_component.dart';
import 'package:tododemo/main_core.dart';
import 'package:tododemo/services/app_component_interface.dart';
import 'package:tododemo/services/local_notification_manager_impl.dart';
import 'package:tododemo/utils/hive_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeHiveDatabase();
  initializeLocalNotificationManager();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    final components = AppComponentBase.build(AppComponent());
    runApp(TodoApp(components));
  });
}