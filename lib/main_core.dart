import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/screen/app_tab_screen.dart';
import 'package:tododemo/service_locator.dart';
import 'package:tododemo/services/app_component_interface.dart';
import 'package:tododemo/services/setting_repository.dart';

class TodoApp extends StatefulWidget {
  final AppComponentBase components;

  TodoApp(this.components);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  void initState() {
    super.initState();
    initializeSystem();
  }

  @override
  Widget build(BuildContext context) {
    return ToDoTheme(
      child: MaterialApp(
        title: 'News Demo',
        theme: ThemeData.light(),
        home: Builder(builder: (context) {
          final settingRepository = locator<SettingRepository>();
          final theme = ToDoTheme.of(context);
          settingRepository.getThemeMode().then((themeMode) {
            final isNightMode = themeMode == AppThemeMode.dark;
            if(theme.isNightMode != isNightMode) {
              ToDoTheme.of(context).changeThemeMode(themeMode == AppThemeMode.dark ? ThemeMode.dark : ThemeMode.light);
            }
          });
          
          return AppTabScreen();
        }),
      ),
    );
  }
}



void initializeSystem() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xfff4f4f4),
      systemNavigationBarIconBrightness: Brightness.dark
  ));
}
