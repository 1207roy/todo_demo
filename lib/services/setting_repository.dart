import 'package:tododemo/models/models.dart';

abstract class SettingRepository {
  Future<void> setThemeMode(bool isNightMode);

  Future<AppThemeMode> getThemeMode();
}
