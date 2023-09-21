import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/app.dart';
import 'package:reader/src/common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage();
  runApp(ProviderScope(child: MyApp()));
}
