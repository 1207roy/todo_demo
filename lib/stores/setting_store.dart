import 'package:mobx/mobx.dart';
import 'package:tododemo/common/mobx_provider.dart';
import 'package:tododemo/models/models.dart';
import 'package:tododemo/service_locator.dart';
import 'package:tododemo/services/services.dart';

part 'setting_store.g.dart';

class SettingStore = _SettingStoreBase with _$SettingStore;

abstract class _SettingStoreBase with Store, Disposable {
  _SettingStoreBase({final SettingRepository settingRepository})
      : _settingRepository = settingRepository ?? locator<SettingRepository>() {
    _initializeThemeStatus();
  }

  final SettingRepository _settingRepository;

  @observable
  bool _hasDarkTheme = false;

  bool get hasDarkTheme => _hasDarkTheme;

  void _initializeThemeStatus() {
    _settingRepository.getThemeMode().then((themeMode) {
      _hasDarkTheme = (themeMode == AppThemeMode.dark);
    });
  }

  @action
  void updateTheme(bool isNightMode) {
    _hasDarkTheme = isNightMode;
    _settingRepository.setThemeMode(isNightMode);
  }
}
