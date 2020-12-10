abstract class InstantLocalPersistenceService {
  Future<void> setBool(String key, bool value);

  Future<bool> getBool(String key, bool defaultValue);

  Future<void> setString(String key, String value);

  Future<String> getString(String key, {String defaultValue});

  Future<void> remove(String key);

  Future<bool> clear();
}
