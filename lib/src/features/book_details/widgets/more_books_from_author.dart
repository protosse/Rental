import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class MoreBooksFromAuthor extends ConsumerStatefulWidget {
  final String authorUrl;
  final String? bookId;

  const MoreBooksFromAuthor({
    super.key,
    required this.authorUrl,
    this.bookId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MoreBooksFromAuthorState();
}

class _MoreBooksFromAuthorState extends ConsumerState<MoreBooksFromAuthor> {
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  _fetch() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookDetailsNotifierProvider(widget.authorUrl).notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(bookDetailsNotifierProvider(widget.authorUrl)).maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const LoadingWidget(),
          data: (data) {
            if (data.feed?.entry?.isEmpty ?? true) {
              return const Text('Empty');
            }
            final items = data.feed?.entry ?? [];
            if (widget.bookId != null) {
              items.removeWhere((element) => element.id?.t == widget.bookId);
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final entry = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BookListItem(entry: entry),
                );
              },
            );
          },
          error: (_, __) => MyErrorWidget(
            refreshCallBack: () => _fetch(),
          ),
        );
  }
}
