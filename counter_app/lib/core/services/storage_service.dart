import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _counterkey = 'counter_value';
  static const String _username = 'username';

  Future<void> saveCounter(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterkey, value);
  }

  Future<void> saveName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_username, name);
  }

  Future<int> getCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_counterkey) ?? 0;
  }

  Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_username) ?? '';
  }

  Future<bool> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
