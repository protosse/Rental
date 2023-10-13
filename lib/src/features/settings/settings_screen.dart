import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reader/src/features/features.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  List<SettingsItem> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      SettingsItem(
        type: SettingsItemType.theme,
        icon: Feather.moon,
        title: 'Dark Mode',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          switch (item.type) {
            case SettingsItemType.theme:
              return ThemeSwitch(
                icon: item.icon,
                title: item.title,
              );
            case SettingsItemType.tile:
              return ListTile(
                onTap: item.action,
                leading: Icon(item.icon),
                title: Text(item.title),
              );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

enum SettingsItemType {
  tile,
  theme,
}

class SettingsItem {
  final SettingsItemType type;
  final IconData icon;
  final String title;
  final void Function()? action;

  SettingsItem({
    required this.type,
    required this.icon,
    required this.title,
    this.action,
  });
}
