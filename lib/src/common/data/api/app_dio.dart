import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:reader/src/common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_dio.g.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    final String baseUrl = ApiEndpoints.baseURL;
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      // connectTimeout: const Duration(milliseconds: 30000),
      // sendTimeout: const Duration(milliseconds: 30000),
      // receiveTimeout: const Duration(milliseconds: 30000),
    );

    interceptors.addAll([
      HeaderInterceptors(),
      LogsInterceptor(),
    ]);

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}

@riverpod
Dio dio(DioRef ref) {
  return AppDio.getInstance();
}

// final dioProvider = Provider<Dio>((ref) => AppDio.getInstance());
