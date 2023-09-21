import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reader/src/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class HomeRepository extends BookRepository {
  HomeRepository(super.httpClient);

  Future<Result<CategoryFeed, ApiError>> getPopularHomeFeed() {
    return getCategory(ApiEndpoints.popular);
  }

  Future<Result<CategoryFeed, ApiError>> getRecentHomeFeed() {
    return getCategory(ApiEndpoints.recent);
  }
}

final homeRepositoryProvider = Provider.autoDispose<HomeRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepository(dio);
});
