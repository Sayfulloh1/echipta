import 'package:shared_preferences/shared_preferences.dart';

class LocalSource {
  SharedPreferences? _preferences;

  LocalSource() {
    _init();
  }


  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool>? putString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  Future<bool>? putInt({required String key, required int value}) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;

    return _preferences!.getInt(key) ?? defValue;
  }

  String getTemporaryToken() => '';

  Future<bool>? putList(String key, List<String> value) {
    if (_preferences == null) return null;
    return _preferences!.setStringList(key, value);
  }

  String getString(String key, {String defValue = ''}) {
    if (_preferences == null) return defValue;

    return _preferences!.getString(key) ?? defValue;
  }

  Future<bool>? deleteString(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  double getDouble(String key, {double defValue = 0.0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  List<String> getList(String key, {List<String> defValue = const []}) {
    if (_preferences == null) return List.empty(growable: true);
    return _preferences!.getStringList(key) ?? List.empty(growable: true);
  }

  Future<bool>? putDouble(String key, double value) {
    if (_preferences == null) return null;
    return _preferences!.setDouble(key, value);
  }

  Future<bool>? deleteDouble(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }

  bool getBool(String key, {bool defValue = true}) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  Future<bool>? putBool({required String key, required bool value}) {
    if (_preferences == null) return null;
    return _preferences!.setBool(key, value);
  }

  Future<bool>? deleteBool(String key) {
    if (_preferences == null) return null;
    return _preferences!.remove(key);
  }
}
