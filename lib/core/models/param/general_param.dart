import 'package:dio/dio.dart';

class GeneralParam {
  final String? id;
  final String? query;
  final int? page;
  final int? limit;
  final CancelToken? cancelToken;

  const GeneralParam({
    this.id,
    this.query,
    this.page,
    this.limit,
    this.cancelToken,
  });

  static const empty = GeneralParam();
}
