import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_details_notifier.g.dart';

@riverpod
class BookDetailsNotifier extends _$BookDetailsNotifier {
  late String _url;
  late BookDetailsRepository _bookDetailsRepository;

  BookDetailsNotifier();

  @override
  Future<CategoryFeed> build(String url) async {
    _url = url;
    _bookDetailsRepository = ref.watch(bookDetailsRepositoryProvider);
    state = const AsyncValue.loading();
    return await _fetch();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetch());
  }

  Future<CategoryFeed> _fetch() async {
    final result = await _bookDetailsRepository.getRelatedFeed(_url);
    switch (result) {
      case Success(wrapValue: final v):
        return v;
      case Failure(exception: final e):
        throw e;
    }
  }
}
