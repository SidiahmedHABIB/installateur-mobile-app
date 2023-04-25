import '../../main.dart';

class LocalDataSource {
  String? getString(String key, {String defaultValue = ""}) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  Future<bool> setInt(String key, int? value) {
    return sharedPreferences.setInt(key, value!);
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  Future<bool> setDouble(String key, double value) {
    return sharedPreferences.setDouble(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return sharedPreferences.getStringList(key) ?? defaultValue;
  }

  Future<bool> setStringList(String key, List<String> value) {
    return sharedPreferences.setStringList(key, value);
  }

  Future<bool> remove(String key) {
    return sharedPreferences.remove(key);
  }

  Future<bool> clear() {
    return sharedPreferences.clear();
  }
}
