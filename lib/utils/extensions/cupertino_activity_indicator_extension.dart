import 'package:flutter/cupertino.dart';
import 'package:tododemo/common/todo_theme.dart';

extension CupertinoActivityIndicatorSupport on CupertinoActivityIndicator {
  Widget getThemedIndicator(BuildContext context, {double radius = 10, bool isDarkMode}) {
    bool isNightTheme = isDarkMode ?? ToDoTheme.of(context).isNightMode;
    return CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(brightness: isNightTheme ? Brightness.dark : Brightness.light),
        child: CupertinoActivityIndicator(radius: radius));
  }
}