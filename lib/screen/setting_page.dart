import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tododemo/common/custom_switch_tile.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/stores/setting_store.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin {
  SettingStore _store;
  ToDoThemeState _theme;

  @override
  void initState() {
    super.initState();
    _store = context.read<SettingStore>();
  }

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return Observer(
      builder: (_) => Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.responsiveWidth(20)),
            child: CustomSwitchTile(
              title: 'Dark Theme',
              subTitle: _store.hasDarkTheme ? 'Dark Mode' : 'Light Mode',
              currentValue: _store.hasDarkTheme,
              onChanged: (isNightTheme) {
                _theme.changeThemeMode(isNightTheme ? ThemeMode.dark : ThemeMode.light);
                _store.updateTheme(isNightTheme);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
