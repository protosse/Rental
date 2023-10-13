import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';

class ThemeSwitch extends ConsumerWidget {
  final IconData icon;
  final String title;

  const ThemeSwitch({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAppTheme = ref.watch(themeNotifierProvider);
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: currentAppTheme.value == AppTheme.dark,
      onChanged: (isDarkMode) {
        final theme = isDarkMode ? AppTheme.dark : AppTheme.light;
        ref.read(themeNotifierProvider.notifier).updateCurrentAppTheme(theme);
      },
    );
  }
}
