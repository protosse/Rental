import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class BookDetailsScreen extends ConsumerStatefulWidget {
  final Entry entry;
  final String? imgTag;

  const BookDetailsScreen({super.key, required this.entry, this.imgTag});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _share(),
            icon: const Icon(Feather.share),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(height: 10.0),
          BookDescriptionSection(
            entry: widget.entry,
            imgTag: widget.imgTag,
          ),
          const SizedBox(height: 30.0),
          const SectionTitle(title: 'Book Description'),
          divider(),
          const SizedBox(height: 10.0),
          DescriptionTextWidget(
              text: widget.entry.summary?.t?.transferred ?? ''),
          const SizedBox(height: 30.0),
          const SectionTitle(
            title: 'More from Author',
          ),
          divider(),
          const SizedBox(height: 10.0),
          MoreBooksFromAuthor(
              bookId: widget.entry.id?.t,
              authorUrl:
                  widget.entry.author?.uri?.t?.replaceAll(r'\&lang=en', '') ??
                      ''),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget divider() {
    return Divider(color: context.theme.textTheme.bodySmall!.color);
  }

  _share() {
    Share.share('${widget.entry.title?.t} by ${widget.entry.author?.name?.t}'
        'Read/Download ${widget.entry.title?.t} from ${widget.entry.downloadUrl}.');
  }
}
