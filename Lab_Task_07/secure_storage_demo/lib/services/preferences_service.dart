
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  static const String _darkModeKey = 'darkMode';
  static const String _displayNameKey = 'displayName';

  Future<void> saveDarkMode(bool value) async {
    await _prefs.setBool(_darkModeKey, value);
  }

  Future<bool> loadDarkMode() async {
    return await _prefs.getBool(_darkModeKey) ?? false;
  }

  Future<void> saveDisplayName(String value) async {
    await _prefs.setString(_displayNameKey, value);
  }

  Future<String> loadDisplayName() async {
    return await _prefs.getString(_displayNameKey) ?? '';
  }
}
dklsjdlsj