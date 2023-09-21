import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class PopularSection extends StatelessWidget {
  final List<Entry> entries;

  const PopularSection({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: ListView.builder(
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemCount: entries.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final Entry entry = entries[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: BookCard(
                img: entry.link?.elementAt(1).href ?? '',
                entry: entry,
              ),
            );
          },
        ),
      ),
    );
  }
}
