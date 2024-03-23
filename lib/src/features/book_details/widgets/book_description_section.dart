import 'package:flutter/material.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class BookDescriptionSection extends StatelessWidget {
  final Entry entry;
  final String? imgTag;

  const BookDescriptionSection({super.key, required this.entry, this.imgTag});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: BookCard(
            img: entry.cover ?? '',
            width: 130,
            tag: imgTag,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Text(
                entry.title?.t ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                entry.author?.name?.t ?? '',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey),
              ),
              const SizedBox(height: 5.0),
              LabelChips(
                labels: entry.category
                        ?.map((e) => e.label)
                        .whereType<String>()
                        .toList() ??
                    [],
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                height: 40,
                child: DownloadButton(
                  entry: entry,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
