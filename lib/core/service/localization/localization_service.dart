import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter_weather_app/core/service/locator/locator.dart';
import 'package:flutter_weather_app/core/service/sharedpreference/preferences_service.dart';
import 'package:flutter/services.dart';

const String _storageKey = 'MyApplication_';

class LocalizationService {
  Locale _locale;
  Map<dynamic, dynamic> _localizedValues;
  VoidCallback _onLocaleChangedCallback;

  final PreferencesService _preferencesService =
      locator<PreferencesServiceImpl>();

  final List<String> supportedLanguages = [
    'English',
    'Bahasa Indonesia',
  ];
  final List<String> supportedLanguagesCodes = ['en', 'id'];

  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((lang) => Locale(lang, ''));

  String text(String key) {
    return (_localizedValues == null || _localizedValues[key] == null)
        ? '** $key not found'
        : _localizedValues[key];
  }

  String get currentLanguage => _locale == null ? '' : _locale.languageCode;
  Locale get locale => _locale;

  Future<Null> init([String language]) async {
    if (_locale == null) {
      await setNewLanguage(language);
    }
    return null;
  }

  Future<String> getPreferredLanguage() async {
    return getApplicationSavedInformation('language');
  }

  Future<bool> setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }

  Future<Null> setNewLanguage(
      [String newLanguage, bool saveInPrefs = false]) async {
    String language = newLanguage;
    language ??= await getPreferredLanguage();
    if (language == '') {
      language = 'en';
    }
    _locale = Locale(language, '');
    final String jsonContent = await rootBundle
        .loadString('asset/locale/localization_${locale.languageCode}.json');
    _localizedValues = json.decode(jsonContent);

    if (saveInPrefs) {
      await setPreferredLanguage(language);
    }
    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback();
    }

    return null;
  }

  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  Future<String> getApplicationSavedInformation(String name) async {
    return await _preferencesService.getString(key: '$_storageKey$name') ?? '';
  }

  Future<bool> _setApplicationSavedInformation(
      String name, String value) async {
    return _preferencesService.setString(
        key: '$_storageKey$name', value: value);
  }

  static final LocalizationService _translations =
      LocalizationService._internal();

  factory LocalizationService() {
    return _translations;
  }

  String kNoInternetFullMsg() => localizationService.text('kNoInternetFullMsg');
  String noInternetTitle() => localizationService.text('noInternetTitle');

  String errorEmptyField({String parm1, String parm2}) =>
      '$parm1${localizationService.text('noInternetTitle')}$parm2';

  LocalizationService._internal();
}

LocalizationService localizationService = LocalizationService();
