import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  factory LocalStorage() {
    return _instance;
  }

  SharedPreferences? _prefs;

  LocalStorage._privateConstructor() {
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }

  SharedPreferences? getSharedPreferences() {
    return _prefs;
  }
}

final localStorageProvider = Provider<SharedPreferences>(
  (_) => LocalStorage().getSharedPreferences()!,
);
