import 'package:reader/src/common/common.dart';
import 'package:sembast/sembast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DownloadLocalDataSource {
  const DownloadLocalDataSource();
  Future<void> addBook(Map<String, dynamic> book, String id);
  Future<void> deleteBook(String id);
  Future<List<Map<String, dynamic>>> downloadList();
  Future<Map<String, dynamic>?> fetchBook(String id);
}

class DownloadLocalDataSourceImpl implements DownloadLocalDataSource {
  final Database _database;
  final StoreRef<String, Map<String, dynamic>> _store;

  DownloadLocalDataSourceImpl(
      {required Database database,
      required StoreRef<String, Map<String, dynamic>> store})
      : _database = database,
        _store = store;

  @override
  Future<void> addBook(Map<String, dynamic> book, String id) async {
    await _store.record(id).put(_database, book, merge: true);
  }

  @override
  Future<void> deleteBook(String id) async {
    await _store.record(id).delete(_database);
  }

  @override
  Future<List<Map<String, dynamic>>> downloadList() async {
    return _store
        .query()
        .getSnapshots(_database)
        .then((value) => value.map((e) => e.value).toList());
  }

  @override
  Future<Map<String, dynamic>?> fetchBook(String id) async {
    return _store.record(id).get(_database);
  }
}

final downloadsLocalDataSourceProvider =
    Provider.autoDispose<DownloadLocalDataSource>(
  (ref) {
    final database = ref.watch(downloadsDatabaseProvider);
    final store = ref.watch(storeRefProvider);
    return DownloadLocalDataSourceImpl(database: database, store: store);
  },
);
