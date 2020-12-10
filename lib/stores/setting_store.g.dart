// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingStore on _SettingStoreBase, Store {
  final _$_hasDarkThemeAtom = Atom(name: '_SettingStoreBase._hasDarkTheme');

  @override
  bool get _hasDarkTheme {
    _$_hasDarkThemeAtom.reportRead();
    return super._hasDarkTheme;
  }

  @override
  set _hasDarkTheme(bool value) {
    _$_hasDarkThemeAtom.reportWrite(value, super._hasDarkTheme, () {
      super._hasDarkTheme = value;
    });
  }

  final _$_SettingStoreBaseActionController =
      ActionController(name: '_SettingStoreBase');

  @override
  void updateTheme(bool isNightMode) {
    final _$actionInfo = _$_SettingStoreBaseActionController.startAction(
        name: '_SettingStoreBase.updateTheme');
    try {
      return super.updateTheme(isNightMode);
    } finally {
      _$_SettingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
