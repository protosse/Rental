import 'dart:async';

import 'package:reader/src/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'download_notifier.g.dart';

@riverpod
class DownloadNotifier extends _$DownloadNotifier {
  late DownloadRepository _repository;
  DownloadNotifier() : super();

  @override
  Future<List<Map<String, dynamic>>> build() async {
    _repository = ref.watch(downloadRepositoryProvider);
    return _repository.downloadList();
  }

  Future<void> fetchBook(String id) async {
    await _repository.fetchBook(id);
  }

  Future<void> addBook(Map<String, dynamic> book, String id) async {
    await _repository.addBook(book, id);
  }

  Future<void> deleteBook(String id) async {
    await _repository.deleteBook(id);
  }
}
