import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:reader/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final dioProvider = Provider<Dio>((ref) => AppDio.getInstance());
