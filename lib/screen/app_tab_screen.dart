import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tododemo/common/mobx_provider.dart';
import 'package:tododemo/common/todo_theme.dart';
import 'package:tododemo/screen/setting_page.dart';
import 'package:tododemo/screen/to_do_detail_view_screen.dart';
import 'package:tododemo/screen/to_do_page.dart';
import 'package:tododemo/stores/setting_store.dart';
import 'package:tododemo/stores/to_do_store.dart';
import 'package:tododemo/utils/extensions/extension.dart';

class AppTabScreen extends StatefulWidget {
  @override
  _AppTabScreenState createState() => _AppTabScreenState();
}

class _AppTabScreenState extends State<AppTabScreen> {
  ToDoThemeState _theme;
  ValueNotifier<int> _pageIndex;
  static const int TODO_PAGE_INDEX = 0;
  static const SETTING_PAGE_INDEX = 1;
  ToDoStore _toDoStore;
  SettingStore _settingStore;

  ReactionDisposer _onToDoResultDisposer;

  @override
  void initState() {
    super.initState();
    _toDoStore = ToDoStore();
    _settingStore = SettingStore();

    _onToDoResultDisposer = reaction((_) => _toDoStore.toDoResult, (_) {
      _toDoStore.toDoResult.maybeWhen((_) {}, error: (error, message) {
        print('error: $error msg: $message');
        //show toast or something to inform the error
      }, orElse: () {});
    });

    _pageIndex = ValueNotifier<int>(TODO_PAGE_INDEX);
  }

  @override
  void dispose() {
    _toDoStore?.dispose();
    _settingStore?.dispose();
    _onToDoResultDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _theme = ToDoTheme.of(context);
    return ValueListenableBuilder<int>(
      valueListenable: _pageIndex,
      builder: (context, pageIndex, ___) {
        return Scaffold(
          backgroundColor: _theme.backgroundColor,
          appBar: _appBar,
          bottomNavigationBar: _bottomNavigationBar,
          body: _widgetOptions[pageIndex],
          floatingActionButton: _floatingActionButton,
        );
      },
    );
  }

  List<Widget> get _widgetOptions => <Widget>[
        MobxProvider.value(value: _toDoStore, child: ToDoPage()),
        MobxProvider.value(value: _settingStore, child: SettingsPage()),
      ];

  String get _title {
    switch (_pageIndex.value) {
      case TODO_PAGE_INDEX:
        return 'ToDos';
      case SETTING_PAGE_INDEX:
        return 'Setting';
      default:
        return '';
    }
  }

  _onTabChange(int pageIndex) => _pageIndex.value = pageIndex;

  AppBar get _appBar => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(_title, style: _theme.appTitleTextStyle.copyWith(fontSize: context.responsiveHorizontalPixel(15))),
      );

  BottomNavigationBar get _bottomNavigationBar => BottomNavigationBar(
        backgroundColor: _theme.footerColor,
        currentIndex: _pageIndex.value,
        selectedItemColor: _theme.selectedTabColor,
        onTap: (value) => _onTabChange(value),
        unselectedItemColor: _theme.unselectedTabColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('ToDos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      );

  Widget get _floatingActionButton => ValueListenableBuilder<int>(
        valueListenable: _pageIndex,
        builder: (BuildContext context, int pageIndex, Widget child) {
          return AnimatedOpacity(
            opacity: pageIndex == 0 ? 1 : 0,
            duration: Duration(milliseconds: 100),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: pageIndex == 1
                  ? null
                  : () => ToDoDetailView.openToDoDetailView(context, _toDoStore),
            ),
          );
        },
      );
}
