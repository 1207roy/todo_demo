import 'dart:async';
import 'dart:core';

import 'package:injectable/injectable.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/resources/shared_preference_keys.dart';
import 'package:tododemo/services/instant_local_persistence_service.dart';
import 'package:tododemo/services/setting_repository.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final InstantLocalPersistenceService _instantLocalPersistenceService;

  SettingRepositoryImpl(
    this._instantLocalPersistenceService,
  );

  @override
  Future<void> setThemeMode(bool isNightMode) async {
    return _instantLocalPersistenceService.setBool(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE, isNightMode);
  }

  @override
  Future<AppThemeMode> getThemeMode() async {
    try {
      final isNightMode = await _instantLocalPersistenceService.getBool(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE, false);
      return isNightMode ? AppThemeMode.dark : AppThemeMode.light;
    } catch (e) {
      return AppThemeMode.light;
    }
  }

  @override
  Future<void> clearData() async {
    var futures = <Future>[];
    futures
      ..add(_instantLocalPersistenceService.remove(SHARED_PREFERENCE_KEY_IS_NIGHT_MODE));
    return Future.wait(futures);
  }
}
