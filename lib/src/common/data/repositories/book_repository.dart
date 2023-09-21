import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:reader/src/common/common.dart';
import 'package:xml2json/xml2json.dart';

abstract class BookRepository {
  final Dio httpClient;

  const BookRepository(this.httpClient);

  Future<Result<CategoryFeed, ApiError>> getCategory(String url) async {
    try {
      final res = await httpClient.get(url);
      final Xml2Json xml2json = Xml2Json();
      xml2json.parse(res.data.toString());
      final json = jsonDecode(xml2json.toGData());
      return Success(CategoryFeed.fromJson(json));
    } on DioException catch (error) {
      return Failure(ApiError(code: error.response?.statusCode ?? 500));
    }
  }
}
