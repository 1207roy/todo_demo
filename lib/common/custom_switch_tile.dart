import 'package:flutter/material.dart';
import 'package:tododemo/common/todo_theme.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool currentValue;
  final Function(bool value) onChanged;

  const CustomSwitchTile({Key key, this.title, this.subTitle, this.currentValue, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ToDoTheme.of(context);
      return SwitchListTile(
        title: Text(title ?? '', style: TextStyle(color: theme.settingTileTitleColor)),
        subtitle: Text(subTitle ?? '', style: TextStyle(color: theme.settingTileSubtitleColor)),
        value: currentValue ?? false,
        onChanged: (bool value) => onChanged(value),
        activeColor: theme.activeColor,
        activeTrackColor: theme.activeTrackColor,
        inactiveThumbColor: theme.inactiveThumbColor,
        inactiveTrackColor: theme.inactiveTrackColor,
        contentPadding: EdgeInsets.all(0.0),
      );
  }
}
