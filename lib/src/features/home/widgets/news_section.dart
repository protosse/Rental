import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class NewSection extends StatelessWidget {
  final List<Entry> entries;

  const NewSection({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        final Entry entry = entries[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          child: BookListItem(entry: entry),
        );
      },
    );
  }
}
