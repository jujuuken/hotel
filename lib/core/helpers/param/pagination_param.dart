import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_param.freezed.dart';

@freezed
sealed class PaginationParam with _$PaginationParam {
  const factory PaginationParam({
    @Default(1) int page,
    @Default(50) int limit,
  }) = _PaginationParam;

  static const empty = PaginationParam();
}
