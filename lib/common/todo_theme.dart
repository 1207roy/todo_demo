import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

const fontFamily = 'Poppins';

class ToDoTheme extends StatefulWidget {
  final Widget child;

  ToDoTheme({
    @required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return ToDoThemeState();
  }

  static ToDoThemeState of(BuildContext context) {
    final _InheritedStateContainer inheritedStateContainer = context.dependOnInheritedWidgetOfExactType();
    if (inheritedStateContainer == null) {
      return ToDoThemeState();
    } else {
      return inheritedStateContainer.data;
    }
  }
}

class ToDoThemeState extends State<ToDoTheme> {
  ThemeMode _themeData = ThemeMode.light;

  bool get isNightMode => _themeData == ThemeMode.dark;
  BehaviorSubject<ThemeMode> _themeChangeStreamController = BehaviorSubject<ThemeMode>.seeded(ThemeMode.light);

  @override
  void dispose() {
    _themeChangeStreamController.close();
    _themeChangeStreamController = null;
    super.dispose();
  }

  void changeThemeMode(ThemeMode mode) {
    _themeChangeStreamController?.add(mode);
    setState(() {
      _themeData = mode;
    });
    changeStatusBarTheme(mode);
  }

  void changeStatusBarTheme(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
          statusBarColor: backgroundColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Color(0xfff4f4f4),
          systemNavigationBarIconBrightness: Brightness.dark
      );
      SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    } else {
      var mySystemTheme = SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: backgroundColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Color(0xff1A1A1A),
          systemNavigationBarIconBrightness: Brightness.light
      );
      SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    }
  }

  Stream<ThemeMode> getThemeChangeStream() => _themeChangeStreamController.stream;

  ThemeMode get currentThemeMode => _themeChangeStreamController.value;

  Color black = Colors.black;
  Color white = Colors.white;

  Color lightBlack1 = Color(0xff202124);
  Color lightBlack2 = Color(0xff313235);
  Color get lightCyanWhite => Color(0xffbdc1c6);
  Color get lightGrey => Color(0xff5f6368);
  Color get backgroundColor => isNightMode ? lightBlack1 : white;
  Color get selectedTabColor => isNightMode ? Color(0xff8ab4f8) : Color(0xff1a73e8);
  Color get unselectedTabColor => isNightMode ? lightCyanWhite : lightGrey;
  Color get borderColor => isNightMode ? Color(0xffe8eaed) : Color(0xff3c4043);
  Color get footerColor => isNightMode ? Color(0xff292c30) : Color(0xfff1f3f4);
  Color get activeColor => isNightMode ? Color(0xff1858b8) : Color(0xff1971e3);
  Color get activeTrackColor => isNightMode ? Color(0xff1d3252) : Color(0xffc4dbf9);
  Color get inactiveThumbColor => isNightMode ? Color(0xffb9b9b9) : Color(0xffececec);
  Color get inactiveTrackColor => isNightMode ? Color(0xff636466) : Color(0xffbdbdbd);
  Color get settingTileTitleColor => isNightMode ? white : black;
  Color get settingTileSubtitleColor => isNightMode ? lightCyanWhite : lightGrey;

  Color get shimmerBaseColor => isNightMode ? Colors.white.withOpacity(0.10) : Colors.grey[300];
  Color get shimmerHighlightColor => isNightMode ? Colors.white.withOpacity(0.13) : Colors.grey[100];
  Color get shimmerCardColor => Color(0x22484848);
  Color get shimmerBackgroundColor => isNightMode ? Colors.black : Color(0xff484848);

  TextStyle get appTitleTextStyle => TextStyle(
    fontFamily: fontFamily,
    color: isNightMode ? white : Color(0xff202124),
    fontWeight: FontWeight.bold,
  );

  TextStyle get toDoTitleTextStyle => TextStyle(
    fontFamily: fontFamily,
    color: isNightMode ? white : Color(0xff202124),
    fontWeight: FontWeight.bold,
  );

  TextStyle get toDoBodyTextStyle => TextStyle(
    fontFamily: fontFamily,
    color: isNightMode ? white : Color(0xff202124),
    fontWeight: FontWeight.normal,
  );

  Color get reminderSaveButtonColor => Color(0xfffbbc04);
  TextStyle get reminderSaveTextStyle => TextStyle(
    fontFamily: fontFamily,
    color: lightBlack1,
    fontWeight: FontWeight.normal,
  );
  TextStyle get reminderCancelTextStyle => TextStyle(
    fontFamily: fontFamily,
    color: isNightMode ? white : lightBlack1,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final ToDoThemeState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
