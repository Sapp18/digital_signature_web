import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static final UserPreference _instancia = UserPreference._internal();

  UserPreference._internal();

  factory UserPreference() {
    return _instancia;
  }

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String token) {
    _prefs.setString('token', token);
  }
}
