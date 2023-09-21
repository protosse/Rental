import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme {
  light,
  dark;

  ThemeData get themeData {
    switch (this) {
      case AppTheme.light:
        return ThemeConfig.lightTheme;
      case AppTheme.dark:
        return ThemeConfig.darkTheme;
    }
  }

  ThemeMode get themeMode {
    switch (this) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
    }
  }
}

class ThemService {
  final SharedPreferences _sharedPreferences;

  const ThemService(this._sharedPreferences);

  Future<bool> setCurrentAppTheme(AppTheme theme) {
    return _sharedPreferences.setString(
        SharedPreferencesKeys.theme, theme.name);
  }

  AppTheme getCurrentAppTheme() {
    return AppTheme.values.byName(
        _sharedPreferences.getString(SharedPreferencesKeys.theme) ??
            AppTheme.light.name);
  }
}

final themeServiceProvider = Provider<ThemService>(
  (ref) {
    return ThemService(ref.watch(localStorageProvider));
  },
);
