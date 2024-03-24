import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_service.g.dart';

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

class ThemeService {
  final SharedPreferences _sharedPreferences;

  const ThemeService(this._sharedPreferences);

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

@riverpod
ThemeService themeService(ThemeServiceRef ref) {
  return ThemeService(ref.watch(sharedPreferencesProvider));
}

// final themeServiceProvider = Provider<ThemeService>(
//   (ref) {
//     return ThemeService(ref.watch(sharedPreferencesProvider));
//   },
// );
