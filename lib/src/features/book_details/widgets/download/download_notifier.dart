import 'dart:async';

import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_notifier.g.dart';

@riverpod
class DownloadNotifier extends _$DownloadNotifier {
  late DownloadRepository _repository;
  DownloadNotifier() : super();

  @override
  Future<List<Book>> build() async {
    _repository = ref.watch(downloadRepositoryProvider);
    return _repository.downloadList();
  }

  Future<void> fetchBook(String id) async {
    await _repository.fetchBook(id);
  }

  Future<void> addBook(Book book, String id) async {
    await _repository.addBook(book, id);
  }

  Future<void> deleteBook(String id) async {
    await _repository.deleteBook(id);
  }
}
