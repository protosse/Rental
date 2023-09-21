import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class BookListItem extends ConsumerWidget {
  final Entry entry;

  const BookListItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCard(
              img: entry.link?.elementAt(1).href ?? '',
              entry: entry,
              width: 100,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.title?.t ?? '',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: context.theme.textTheme.titleLarge!.color),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    entry.author?.name?.t ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    entry.summary?.t ?? '',
                    style: TextStyle(
                      fontSize: 13,
                      color: context.theme.textTheme.bodySmall!.color,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
