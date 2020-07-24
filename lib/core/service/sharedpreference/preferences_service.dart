import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesService {
  Future<bool> saveCredentials(
      {@required String email, @required String token});

  Future<String> getToken();

  Future<String> getEmail();
  Future<bool> clearSession();

  Future<void> setEmail(String email);

  Future<String> getString({@required String key});
  Future setString({@required String key, @required String value});
}

class PreferencesServiceImpl implements PreferencesService {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  static const userToken = 'user_token';
  static const userEmail = 'user_email';
  static const settingsLanguageLocale = 'settings_language_locale';

  @override
  Future<bool> saveCredentials(
      {@required String email, @required String token}) async {
    bool isTransactionSuccessful = false;

    final SharedPreferences pref = await prefs;
    if (token != null) {
      isTransactionSuccessful = await pref.setString(userToken, token);
    }
    if (email != null) {
      isTransactionSuccessful = await pref.setString(userEmail, email);
    }

    return isTransactionSuccessful;
  }

  @override
  Future setString({@required String key, @required String value}) async {
    final SharedPreferences pref = await prefs;
    await pref.setString(key, value);
  }

  @override
  Future<String> getString({@required String key}) async {
    final SharedPreferences pref = await prefs;
    return pref.getString(key);
  }

  @override
  Future<void> setEmail(String email) async {
    final SharedPreferences pref = await prefs;
    await pref.setString(userEmail, email);
  }

  @override
  Future<bool> clearSession() async {
    final SharedPreferences pref = await prefs;
    final String languageLocale = pref.getString(settingsLanguageLocale);
    final bool result = await pref.clear();
    await pref.setString(settingsLanguageLocale, languageLocale);
    return result;
  }

  @override
  Future<String> getEmail() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(userEmail);
  }

  @override
  Future<String> getToken() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(userToken);
  }
}
