import 'dart:convert';
import 'package:reader/src/common/common.dart';
import 'package:dio/dio.dart';

class LogsInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.d("请求url: ${options.uri}");
    logger.d('请求头: ${options.headers}');
    if (options.data != null) {
      logger.d('请求参数: ${options.data}');
    }
    handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    String s = const JsonEncoder().convert(response.data);
    logger.d('返回参数: $s');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.d('请求异常: $err');
    logger.d('请求异常信息: ${err.response}');
    handler.next(err);
  }
}
