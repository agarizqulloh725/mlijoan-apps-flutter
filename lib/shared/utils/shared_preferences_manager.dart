import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // Variabel untuk menyimpan instance SharedPreferences
  static SharedPreferences? _prefs;

  // Menginisialisasi SharedPreferences sekali saja
  static Future<void> _initPrefs() async {
    // ignore: prefer_conditional_assignment
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  // Menyimpan data bertipe String
  static Future<void> saveString(String key, String value) async {
    await _initPrefs(); // Pastikan SharedPreferences diinisialisasi sebelum digunakan
    await _prefs?.setString(key, value);
  }

  // Menyimpan data bertipe bool
  static Future<void> saveBool(String key, bool value) async {
    await _initPrefs();
    await _prefs?.setBool(key, value);
  }

  // Menyimpan data bertipe int
  static Future<void> saveInt(String key, int value) async {
    await _initPrefs();
    await _prefs?.setInt(key, value);
  }

  // Menyimpan data bertipe double
  static Future<void> saveDouble(String key, double value) async {
    await _initPrefs();
    await _prefs?.setDouble(key, value);
  }

  // Menyimpan data bertipe List<String>
  static Future<void> saveStringList(String key, List<String> value) async {
    await _initPrefs();
    await _prefs?.setStringList(key, value);
  }

  // Mengambil data bertipe String
  static Future<String?> getString(String key) async {
    await _initPrefs();
    return _prefs?.getString(key);
  }

  // Mengambil data bertipe bool
  static Future<bool?> getBool(String key) async {
    await _initPrefs();
    return _prefs?.getBool(key);
  }

  // Mengambil data bertipe int
  static Future<int?> getInt(String key) async {
    await _initPrefs();
    return _prefs?.getInt(key);
  }

  // Mengambil data bertipe double
  static Future<double?> getDouble(String key) async {
    await _initPrefs();
    return _prefs?.getDouble(key);
  }

  // Mengambil data bertipe List<String>
  static Future<List<String>?> getStringList(String key) async {
    await _initPrefs();
    return _prefs?.getStringList(key);
  }

  // Menghapus data berdasarkan key
  static Future<void> remove(String key) async {
    await _initPrefs();
    await _prefs?.remove(key);
  }

  // Menghapus semua data yang ada di SharedPreferences
  static Future<void> clear() async {
    await _initPrefs();
    await _prefs?.clear();
  }
}
