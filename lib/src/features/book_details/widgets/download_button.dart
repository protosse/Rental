import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';

class DownloadButton extends ConsumerWidget {
  final Entry entry;

  const DownloadButton({super.key, required this.entry});

  String? get id => entry.id?.t;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id != null) {
      final book = ref
          .watch(downloadNotifierProvider)
          .valueOrNull
          ?.firstWhere((element) => element['id'] == id);
      return Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          onTap: () {
            if (book != null) {
              openBook(book['path'] as String, context, ref);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                book == null ? 'Download' : 'Read',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  download() {}

  Future<void> openBook(
    String path,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final bookFile = File(path);
    if (bookFile.existsSync()) {
      EpubController controller =
          EpubController(document: EpubDocument.openFile(bookFile));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return EpubView(controller: controller);
          },
        ),
      );
    } else {
      context.showSnackBarUsingText(
          'Could not find the book file. Please download it again');
      if (id != null) {
        ref.read(downloadNotifierProvider.notifier).deleteBook(id!);
      }
    }
  }
}
