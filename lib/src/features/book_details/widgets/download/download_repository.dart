import 'package:reader/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DownloadRepository {
  const DownloadRepository();
  Future<void> addBook(Map<String, dynamic> book, String id);
  Future<void> deleteBook(String id);
  Future<List<Map<String, dynamic>>> downloadList();
  Future<Map<String, dynamic>?> fetchBook(String id);
}

class DownloadRepositoryImpl extends DownloadRepository {
  final DownloadLocalDataSource localDataSource;

  DownloadRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addBook(Map<String, dynamic> book, String id) async {
    await localDataSource.addBook(book, id);
  }

  @override
  Future<void> deleteBook(String id) async {
    await localDataSource.deleteBook(id);
  }

  @override
  Future<List<Map<String, dynamic>>> downloadList() async {
    return await localDataSource.downloadList();
  }

  @override
  Future<Map<String, dynamic>?> fetchBook(String id) async {
    return await localDataSource.fetchBook(id);
  }
}

final downloadRepositoryProvider = Provider.autoDispose<DownloadRepository>(
  (ref) {
    final localDataSource = ref.watch(downloadsLocalDataSourceProvider);
    return DownloadRepositoryImpl(localDataSource: localDataSource);
  },
);
