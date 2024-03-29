import 'package:shared_preferences/shared_preferences.dart';

class RepoSettings {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> authorized() async {
    if (prefs == null) return false;
    return prefs?.setBool('auth', true);
  }

  Future<bool?> isAuthorize() async {
    if (prefs == null) return false;
    return prefs?.getBool('auth');
  }

  Future<bool?> logout() async {
    if (prefs == null) return false;
    return prefs?.setBool('auth', false);
  }

  Future<bool?> saveLocale(String locale) async {
    if (prefs == null) return false;
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    if (prefs == null) return null;
    return prefs?.getString('locale');
  }
}
