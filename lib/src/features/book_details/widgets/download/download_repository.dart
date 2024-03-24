import 'package:reader/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DownloadRepository {
  const DownloadRepository();
  Future<void> addBook(Book book, String id);
  Future<void> deleteBook(String id);
  Future<List<Book>> downloadList();
  Future<Book?> fetchBook(String id);
}

class DownloadRepositoryImpl extends DownloadRepository {
  final DownloadLocalDataSource localDataSource;

  DownloadRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addBook(Book book, String id) async {
    await localDataSource.addBook(book.toJson(), id);
  }

  @override
  Future<void> deleteBook(String id) async {
    await localDataSource.deleteBook(id);
  }

  @override
  Future<List<Book>> downloadList() async {
    return await localDataSource
        .downloadList()
        .then((value) => value.map((e) => Book.fromJson(e)).toList());
  }

  @override
  Future<Book?> fetchBook(String id) async {
    return await localDataSource
        .fetchBook(id)
        .then((value) => value == null ? null : Book.fromJson(value));
  }
}

final downloadRepositoryProvider = Provider.autoDispose<DownloadRepository>(
  (ref) {
    final localDataSource = ref.watch(downloadsLocalDataSourceProvider);
    return DownloadRepositoryImpl(localDataSource: localDataSource);
  },
);
