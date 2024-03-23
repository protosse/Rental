import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reader/src/common/common.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentApptheme = ref.watch(themeNotifierProvider);
    final currentAppthemeValue = currentApptheme.value ?? AppTheme.light;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData(currentAppthemeValue.themeData),
      darkTheme: themeData(AppTheme.dark.themeData),
      themeMode: currentAppthemeValue.themeMode,
      routerConfig: _appRouter.config(),
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSans3TextTheme(theme.textTheme),
    );
  }
}
