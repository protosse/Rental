import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_feed_notifier.g.dart';

typedef HomeFeedData = ({CategoryFeed popularFeed, CategoryFeed recentFeed});

@riverpod
class HomeFeedNotifier extends _$HomeFeedNotifier {
  HomeFeedNotifier() : super();

  @override
  Future<HomeFeedData> build() async {
    state = const AsyncValue.loading();
    return _fetch();
  }

  Future<void> fetch() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await _fetch());
  }

  Future<HomeFeedData> _fetch() async {
    final HomeRepository homeRepository = ref.read(homeRepositoryProvider);

    CategoryFeed popularFeed;
    final popularFeedResult = await homeRepository.getPopularHomeFeed();
    switch (popularFeedResult) {
      case Success(wrapValue: final v):
        popularFeed = v;
      case Failure(exception: final e):
        throw e;
    }

    CategoryFeed recentFeed;
    final recentFeedResult = await homeRepository.getRecentHomeFeed();
    switch (recentFeedResult) {
      case Success(wrapValue: final v):
        recentFeed = v;
      case Failure(exception: final e):
        throw e;
    }

    return (popularFeed: popularFeed, recentFeed: recentFeed);
  }
}
