import 'package:injectable/injectable.dart';
import 'package:tododemo/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: InstantLocalPersistenceService)
class SharedPrefService implements InstantLocalPersistenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<SharedPreferences> _getSharedPrefs() => _prefs;

  @override
  Future<bool> getBool(String key, bool defaultValue) async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return sharedPreferences.getBool(key) ?? defaultValue;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setBool(String key, bool value) async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return await sharedPreferences.setBool(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getString(String key, {String defaultValue}) async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return sharedPreferences.getString(key) ?? defaultValue;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return sharedPreferences.setString(key, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> clear() async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return sharedPreferences.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      var sharedPreferences = await _getSharedPrefs();
      return sharedPreferences.remove(key);
    } catch (e) {
      rethrow;
    }
  }
}
