import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_param.freezed.dart';

@freezed
sealed class GeneralParam with _$GeneralParam {
  const factory GeneralParam({
    String? id,
    String? query,
    int? page,
    int? limit,
    CancelToken? cancelToken,
  }) = _GeneralParam;

  static const empty = GeneralParam();
}
